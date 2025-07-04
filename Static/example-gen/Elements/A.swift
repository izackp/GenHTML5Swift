//
//  A.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <a> Hyperlink
public class A : NHTMLRenderable, IFlow, IInteractive, IPalpable, IPhrasing {

    /// Whether to download the resource instead of navigating to it, and its file name if so.
    public var download:String?

    /// Address of the hyperlink. Valid URL potentially surrounded by spaces.
    public var href:URL?

    /// Language of the linked resource. Valid BCP 47 language tag.
    public var hreflang:String?

    /// URLs to ping. Set of space-separated tokens consisting of valid non-empty URLs.
    public var ping:[URL]

    /// Referrer policy for fetches initiated by the element. Referrer policy.
    public var referrerpolicy:ReferrerPolicy?

    /// Relationship between the location in the document containing the hyperlink and the destination resource. Unordered set of unique space-separated tokens. The actual rules are more complicated than indicated.
    public var rel:[String]

    /// Browsing context for hyperlink navigation. Valid browsing context name or keyword.
    public var target:String?

    /// Hint for the type of the referenced resource. Valid MIME type string.
    public var type:String?


    public init() {
        super.init()
    }

    public init(_ attributes:[String:String], _ parser:XMLParser? = nil) throws {
        var globalAttr = GlobalAttributesBuilder()
        for (key, value) in attributes {
            switch (key) {
                case "download":
                    download = value
                case "href":
                    href = value
                case "hreflang":
                    hreflang = value
                case "ping":
                    ping = value
                case "referrerpolicy":
                    referrerpolicy = value
                case "rel":
                    rel = value
                case "target":
                    target = value
                case "type":
                    type = value

                default: break
            }
            if globalAttr.trySetGlobalAttribute(key, value) {
                continue
            }
            throw AppError("Unexpected attribute: \(key)")
        }
        var allItems:[NHTMLRenderable] = []
        while let obj = try parser?.readObject(endTag: "a", xmlToHtmlMapper) {
            allItems.append(obj)
        }
        super.init(globalAttr, allItems)
    }

}