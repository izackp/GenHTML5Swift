//
//  FilteredDictionary.swift
//  HTMLStandard
//
//  Created by Isaac Paul on 7/4/25.
//


class FilteredDictionary<T: Decodable> : Decodable {
    var content = [String:T]()
    
    struct CodingKeys: CodingKey, Hashable {
        var stringValue: String
        
        init(stringValue: String) {
            self.stringValue = stringValue
        }
        
        // Unused, only for int-backed Codables.
        var intValue: Int? { return nil }
        init?(intValue: Int) { return nil }
    }
    
    required public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let allKeys = container.allKeys
        for key in allKeys {
            if (key.stringValue == "__META__") {
                continue
            }
            
            let someObj = try container.decode(T.self, forKey: key)
            content[key.stringValue] = someObj
        }
    }
}
