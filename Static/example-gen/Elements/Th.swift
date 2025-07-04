//
//  Th.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <th> Table header cell
public class Th : NHTMLRenderable, IInteractive {

    public enum Scope : String, CaseIterable {

        case col
        case colgroup
        case row
        case rowgroup

        public init?(rawValue: Substring) {
            guard
                let value = Self.allCases.first(where: { $0.rawValue == rawValue })
            else
                { return nil }
            
            self = value
        }
        
        public init(expect: Substring) throws {
            guard
                let value = Self.allCases.first(where: { $0.rawValue == expect })
            else
                { throw AppError("Unexpected value for Scope: \(expect)") }
            
            self = value
        }
        
        public init(expect: String) throws {
            guard let result = Scope(rawValue: expect) else {
                throw AppError("Unexpected value for Scope: \(expect)")
            }
            self = result
        }
        
    }

    /// Alternative label to use for the header cell when referencing the cell in other contexts. Text. The actual rules are more complicated than indicated.
    public var abbr:String?

    /// Number of columns that the cell is to span. Valid non-negative integer greater than zero.
    public var colspan:UInt?

    /// The header cells for this cell. Unordered set of unique space-separated tokens, case-sensitive, consisting of IDs. The actual rules are more complicated than indicated.
    public var headers:[String]

    /// Number of rows that the cell is to span. Valid non-negative integer.
    public var rowspan:UInt?

    /// Specifies which cells the header cell applies to.
    public var scope:Scope?


    public init() {
        super.init()
    }

    public init(_ attributes:[String:String], _ parser:XMLParser? = nil) throws {
        var globalAttr = GlobalAttributesBuilder()
        for (key, value) in attributes {
            switch (key) {
                case "abbr":
                    abbr = value
                case "colspan":
                    colspan = value
                case "headers":
                    headers = value
                case "rowspan":
                    rowspan = value
                case "scope":
                    scope = try Scope(expect: value)

                default: break
            }
            if globalAttr.trySetGlobalAttribute(key, value) {
                continue
            }
            throw AppError("Unexpected attribute: \(key)")
        }
        var allItems:[NHTMLRenderable] = []
        while let obj = try parser?.readObject(endTag: "th", xmlToHtmlMapper) {
            allItems.append(obj)
        }
        super.init(globalAttr, allItems)
    }


    public func addChild(_ someElement:IFlow) {
        children.append(someElement)
    }
}