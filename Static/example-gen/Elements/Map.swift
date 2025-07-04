//
//  Map.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <map> Image map
public class Map : NHTMLRenderable, IFlow, IPalpable, IPhrasing {

    /// Name of image map to reference from the usemap attribute. Text. The actual rules are more complicated than indicated.
    public var name:String?


    public init() {
        super.init()
    }

    public init(_ attributes:[String:String], _ parser:XMLParser? = nil) throws {
        var globalAttr = GlobalAttributesBuilder()
        for (key, value) in attributes {
            switch (key) {
                case "name":
                    name = value

                default: break
            }
            if globalAttr.trySetGlobalAttribute(key, value) {
                continue
            }
            throw AppError("Unexpected attribute: \(key)")
        }
        var allItems:[NHTMLRenderable] = []
        while let obj = try parser?.readObject(endTag: "map", xmlToHtmlMapper) {
            allItems.append(obj)
        }
        super.init(globalAttr, allItems)
    }

}