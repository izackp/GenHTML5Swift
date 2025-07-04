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
}

public struct AttributeDef : Codable {
    public let desc: String
    public let next: String?
    public let elements: [String] //Elements that use the attribute
    public let value_keywords: [String]
    public let value_type: String //Desc
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
