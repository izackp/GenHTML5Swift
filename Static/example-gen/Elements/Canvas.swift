//
//  Canvas.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <canvas> Scriptable bitmap canvas
public class Canvas : NHTMLRenderable, IEmbedded, IFlow, IPalpable, IPhrasing {

    /// Vertical dimension. Valid non-negative integer.
    public var height:UInt?

    /// Horizontal dimension. Valid non-negative integer.
    public var width:UInt?


    public init() {
        super.init()
    }

    public init(_ attributes:[String:String], _ parser:XMLParser? = nil) throws {
        var globalAttr = GlobalAttributesBuilder()
        for (key, value) in attributes {
            switch (key) {
                case "height":
                    height = value
                case "width":
                    width = value

                default: break
            }
            if globalAttr.trySetGlobalAttribute(key, value) {
                continue
            }
            throw AppError("Unexpected attribute: \(key)")
        }
        var allItems:[NHTMLRenderable] = []
        while let obj = try parser?.readObject(endTag: "canvas", xmlToHtmlMapper) {
            allItems.append(obj)
        }
        super.init(globalAttr, allItems)
    }

}