//
//  Object.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <object> Image, nested browsing context, or plugin
public class Object : NHTMLRenderable, IEmbedded, IFlow, IFormAssociated, IInteractive, IListed, IPalpable, IPhrasing, ISubmittable {

    /// Address of the resource. Valid non-empty URL potentially surrounded by spaces.
    public var data:URL

    /// Associates the element with a form element. ID. The actual rules are more complicated than indicated.
    public var form:String?

    /// Vertical dimension. Valid non-negative integer.
    public var height:UInt?

    /// Name of nested browsing context. Valid browsing context name or keyword.
    public var name:String?

    /// Type of embedded resource. Valid MIME type string.
    public var type:String?

    /// Name of image map to use. Valid hash-name reference. The actual rules are more complicated than indicated.
    public var usemap:String?

    /// Horizontal dimension. Valid non-negative integer.
    public var width:UInt?


    public init() {
        super.init()
    }

    public init(_ attributes:[String:String], _ parser:XMLParser? = nil) throws {
        var globalAttr = GlobalAttributesBuilder()
        for (key, value) in attributes {
            switch (key) {
                case "data":
                    data = value
                case "form":
                    form = value
                case "height":
                    height = value
                case "name":
                    name = value
                case "type":
                    type = value
                case "usemap":
                    usemap = value
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
        while let obj = try parser?.readObject(endTag: "object", xmlToHtmlMapper) {
            allItems.append(obj)
        }
        super.init(globalAttr, allItems)
    }

}