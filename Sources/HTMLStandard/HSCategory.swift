//
//  HSCategory.swift
//  HTMLStandard
//
//  Created by Isaac Paul on 3/13/25.
//

public struct Category {
    public let name: String
    public let definition: CategoryDef
}

public struct CategoryDef : Codable {
    public let elements: [String] //Elements that are part of that category
    public let elements_maybe: [String]
    public let exceptions: String //Desc
}
