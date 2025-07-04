//
//  Ol.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <ol> Ordered list
public class Ol : NHTMLRenderable, IFlow, IPalpable {

    public enum Type : String, CaseIterable {

        case 1
        case A
        case I
        case a
        case i

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
                { throw AppError("Unexpected value for Type: \(expect)") }
            
            self = value
        }
        
        public init(expect: String) throws {
            guard let result = Type(rawValue: expect) else {
                throw AppError("Unexpected value for Type: \(expect)")
            }
            self = result
        }
        
    }

    /// Number the list backwards.
    public var reversed:Bool

    /// Starting value of the list. Valid integer.
    public var start:Int?

    /// Kind of list marker.
    public var type:Type?


    public init() {
        super.init()
    }

    public init(_ attributes:[String:String], _ parser:XMLParser? = nil) throws {
        var globalAttr = GlobalAttributesBuilder()
        for (key, value) in attributes {
            switch (key) {
                case "reversed":
                    reversed = value
                case "start":
                    start = value
                case "type":
                    type = try Type(expect: value)

                default: break
            }
            if globalAttr.trySetGlobalAttribute(key, value) {
                continue
            }
            throw AppError("Unexpected attribute: \(key)")
        }
        var allItems:[NHTMLRenderable] = []
        while let obj = try parser?.readObject(endTag: "ol", xmlToHtmlMapper) {
            allItems.append(obj)
        }
        super.init(globalAttr, allItems)
    }


    public func addChild(_ someElement:IScriptSupporting) {
        children.append(someElement)
    }
}