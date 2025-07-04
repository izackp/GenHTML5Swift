//
//  Details.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <details> Disclosure control for hiding details
public class Details : NHTMLRenderable, IFlow, IInteractive, IPalpable, ISectioningRoot {

    /// Whether the details are visible.
    public var open:Bool


    public init() {
        super.init()
    }

    public init(_ attributes:[String:String], _ parser:XMLParser? = nil) throws {
        var globalAttr = GlobalAttributesBuilder()
        for (key, value) in attributes {
            switch (key) {
                case "open":
                    open = value

                default: break
            }
            if globalAttr.trySetGlobalAttribute(key, value) {
                continue
            }
            throw AppError("Unexpected attribute: \(key)")
        }
        var allItems:[NHTMLRenderable] = []
        while let obj = try parser?.readObject(endTag: "details", xmlToHtmlMapper) {
            allItems.append(obj)
        }
        super.init(globalAttr, allItems)
    }


    public func addChild(_ someElement:IFlow) {
        children.append(someElement)
    }
}