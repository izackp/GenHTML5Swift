//
//  String+Ext.swift
//  gen_html
//
//  Created by Isaac Paul on 5/6/25.
//

extension String {
    func uppercaseFirstLetter() -> String {
        guard let firstLetter = self.first else { return self }
        return firstLetter.uppercased() + self.dropFirst()
    }
    
    func toCamelCase() -> String {
        let components = self.split(separator: "-")
        guard let first = components.first?.lowercased() else { return "" }
        
        let rest = components.dropFirst().map { $0.capitalized }
        let camelCase = ([first] + rest).joined()

        return camelCase
    }
    
}
