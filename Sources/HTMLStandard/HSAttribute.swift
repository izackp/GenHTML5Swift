//
//  HSAttribute.swift
//  HTMLStandard
//
//  Created by Isaac Paul on 3/13/25.
//

public struct Attribute {
    public let name: String
    public let indexName: String
    public let definition: AttributeDef
    
    public func enumName() -> String {
        if (name == "type") {
            return "AttrType"
        }
        
        guard let firstLetter = name.first else { return name }
        return firstLetter.uppercased() + name.dropFirst()
    }
    
    public func varName() -> String {
        if (name == "for") {
            return "for_"
        }
        if (name == "defer") {
            return "defer_"
        }
        if (name == "class") {
            return "class_"
        }
        if (name == "is") {
            return "is_"
        }
        if (name == "subscript") {
            return "subscript_"
        }
        return name
    }
}

public struct AttributeDef : Codable {
    public let desc: String
    public let next: String?
    public let elements: [String] //Elements that use the attribute
    public let value_keywords: [String]
    public let value_type: String //Desc
    
    public func isYesNoBool() -> Bool {
        if (value_keywords.count != 2) {
            return false
        }
        let first = value_keywords[0]
        if (first != "yes" && first != "no") {
            return false
        }
        let second = value_keywords[1]
        if (second != "yes" && second != "no") {
            return false
        }
        return true
    }
    
    public func isTrueFalseBool() -> Bool {
        if (value_keywords.count != 2) {
            return false
        }
        let first = value_keywords[0]
        if (first != "true" && first != "false") {
            return false
        }
        let second = value_keywords[1]
        if (second != "true" && second != "false") {
            return false
        }
        return true
    }
}

public extension Attribute {
    func isGlobal() -> Bool {
        switch(name) {
            default:
                false
        }
    }
    
    func isBoolean() -> Bool {
        switch(definition.value_type == "Boolean attribute") {
            default:
                false
        }
    }
}
