//
//  Bdo.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <bdo> Text directionality formatting
public class Bdo : NHTMLRenderable, IFlow, IPalpable, IPhrasing {

    public enum Dir : String, CaseIterable {

        case ltr
        case rtl

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
                { throw AppError("Unexpected value for Dir: \(expect)") }
            
            self = value
        }
        
        public init(expect: String) throws {
            guard let result = Dir(rawValue: expect) else {
                throw AppError("Unexpected value for Dir: \(expect)")
            }
            self = result
        }
        
    }

    /// The text directionality of the element.
    public var dir:Dir?


    public init() {
        super.init()
    }

    public init(_ attributes:[String:String], _ parser:XMLParser? = nil) throws {
        var globalAttr = GlobalAttributesBuilder()
        for (key, value) in attributes {
            switch (key) {
                case "dir":
                    dir = try Dir(expect: value)

                default: break
            }
            if globalAttr.trySetGlobalAttribute(key, value) {
                continue
            }
            throw AppError("Unexpected attribute: \(key)")
        }
        var allItems:[NHTMLRenderable] = []
        while let obj = try parser?.readObject(endTag: "bdo", xmlToHtmlMapper) {
            allItems.append(obj)
        }
        super.init(globalAttr, allItems)
    }


    public func addChild(_ someElement:IPhrasing) {
        children.append(someElement)
    }
}