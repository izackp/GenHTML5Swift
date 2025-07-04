//
//  Link.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <link> Link metadata
public class Link : NHTMLRenderable, IFlow, IMetaData, IPhrasing {

    public enum Crossorigin : String, CaseIterable {

        case anonymous
        case useCredentials = "use-credentials"

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
                { throw AppError("Unexpected value for Crossorigin: \(expect)") }
            
            self = value
        }
        
        public init(expect: String) throws {
            guard let result = Crossorigin(rawValue: expect) else {
                throw AppError("Unexpected value for Crossorigin: \(expect)")
            }
            self = result
        }
        
    }

    /// Potential destination for a preload request (for rel="preload" and rel="modulepreload"). Potential destination, for rel="preload"; script-like destination, for rel="modulepreload".
    public var as:String?

    /// How the element handles crossorigin requests.
    public var crossorigin:Crossorigin?

    /// Address of the hyperlink. Valid non-empty URL potentially surrounded by spaces.
    public var href:URL

    /// Language of the linked resource. Valid BCP 47 language tag.
    public var hreflang:String?

    /// Image sizes for different page layouts. Valid source size list.
    public var imagesizes:[String]

    /// Images to use in different situations (e.g., high-resolution displays, small monitors, etc.). Comma-separated list of image candidate strings.
    public var imagesrcset:[String]

    /// Integrity metadata used in Subresource Integrity checks [SRI].
    public var integrity:String?

    /// Applicable media. Valid media query list.
    public var media:String?

    /// Referrer policy for fetches initiated by the element. Referrer policy.
    public var referrerpolicy:ReferrerPolicy?

    /// Relationship between the document containing the hyperlink and the destination resource. Unordered set of unique space-separated tokens. The actual rules are more complicated than indicated.
    public var rel:[String]

    /// Sizes of the icons (for rel="icon"). Unordered set of unique space-separated tokens, ASCII case-insensitive, consisting of sizes. The actual rules are more complicated than indicated.
    public var sizes:[String]

    ///  Title of the link or CSS style sheet set name. Text or Text
    public var title:String?

    /// Hint for the type of the referenced resource. Valid MIME type string.
    public var type:String?


    public init() {
        super.init()
    }

    public init(_ attributes:[String:String], _ parser:XMLParser? = nil) throws {
        var globalAttr = GlobalAttributesBuilder()
        for (key, value) in attributes {
            switch (key) {
                case "as":
                    as = value
                case "crossorigin":
                    crossorigin = try Crossorigin(expect: value)
                case "href":
                    href = value
                case "hreflang":
                    hreflang = value
                case "imagesizes":
                    imagesizes = value
                case "imagesrcset":
                    imagesrcset = value
                case "integrity":
                    integrity = value
                case "media":
                    media = value
                case "referrerpolicy":
                    referrerpolicy = value
                case "rel":
                    rel = value
                case "sizes":
                    sizes = value
                case "title":
                    title = value
                case "type":
                    type = value

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