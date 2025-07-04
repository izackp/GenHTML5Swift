//
//  Base.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <base> Base URL and default target browsing context for hyperlinks and forms
public class Base : NHTMLRenderable, IMetaData {

    /// Document base URL. Valid URL potentially surrounded by spaces.
    public var href:URL?

    /// Default browsing context for hyperlink navigation and form submission. Valid browsing context name or keyword.
    public var target:String?


    public init() {
        super.init()
    }

    public init(_ attributes:[String:String], _ parser:XMLParser? = nil) throws {
        var globalAttr = GlobalAttributesBuilder()
        for (key, value) in attributes {
            switch (key) {
                case "href":
                    href = value
                case "target":
                    target = value

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