//
//  Td.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <td> Table cell
public class Td : NHTMLRenderable, ISectioningRoot {

    /// Number of columns that the cell is to span. Valid non-negative integer greater than zero.
    public var colspan:UInt?

    /// The header cells for this cell. Unordered set of unique space-separated tokens, case-sensitive, consisting of IDs. The actual rules are more complicated than indicated.
    public var headers:[String]

    /// Number of rows that the cell is to span. Valid non-negative integer.
    public var rowspan:UInt?


    public init() {
        super.init()
    }

    public init(_ attributes:[String:String], _ parser:XMLParser? = nil) throws {
        var globalAttr = GlobalAttributesBuilder()
        for (key, value) in attributes {
            switch (key) {
                case "colspan":
                    colspan = value
                case "headers":
                    headers = value
                case "rowspan":
                    rowspan = value

                default: break
            }
            if globalAttr.trySetGlobalAttribute(key, value) {
                continue
            }
            throw AppError("Unexpected attribute: \(key)")
        }
        var allItems:[NHTMLRenderable] = []
        while let obj = try parser?.readObject(endTag: "td", xmlToHtmlMapper) {
            allItems.append(obj)
        }
        super.init(globalAttr, allItems)
    }


    public func addChild(_ someElement:IFlow) {
        children.append(someElement)
    }
}