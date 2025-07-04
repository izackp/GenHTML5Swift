//
//  Embed.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <embed> Plugin
public class Embed : NHTMLRenderable, IEmbedded, IFlow, IInteractive, IPalpable, IPhrasing {

    /// Vertical dimension. Valid non-negative integer.
    public var height:UInt?

    /// Address of the resource. Valid non-empty URL potentially surrounded by spaces.
    public var src:URL

    /// Type of embedded resource. Valid MIME type string.
    public var type:String?

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
                case "src":
                    src = value
                case "type":
                    type = value
                case "width":
                    width = value

                default: break
            }
            if globalAttr.trySetGlobalAttribute(key, value) {
                continue
            }
            throw AppError("Unexpected attribute: \(key)")
        }
        super.init(globalAttr)
    }

}