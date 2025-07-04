//
//  Ins.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <ins> An addition to the document
public class Ins : NHTMLRenderable, IFlow, IPalpable, IPhrasing {

    /// Link to the source of the quotation or more information about the edit. Valid URL potentially surrounded by spaces.
    public var cite:URL?

    /// Date and (optionally) time of the change. Valid date string with optional time.
    public var datetime:String?


    public init() {
        super.init()
    }

    public init(_ attributes:[String:String], _ parser:XMLParser? = nil) throws {
        var globalAttr = GlobalAttributesBuilder()
        for (key, value) in attributes {
            switch (key) {
                case "cite":
                    cite = value
                case "datetime":
                    datetime = value

                default: break
            }
            if globalAttr.trySetGlobalAttribute(key, value) {
                continue
            }
            throw AppError("Unexpected attribute: \(key)")
        }
        var allItems:[NHTMLRenderable] = []
        while let obj = try parser?.readObject(endTag: "ins", xmlToHtmlMapper) {
            allItems.append(obj)
        }
        super.init(globalAttr, allItems)
    }

}