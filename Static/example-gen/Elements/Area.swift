//
//  Area.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <area> Hyperlink or dead area on an image map
public class Area : NHTMLRenderable, IFlow, IPhrasing {

    public enum Shape : String, CaseIterable {

        case circle
        case default
        case poly
        case rect

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
                { throw AppError("Unexpected value for Shape: \(expect)") }
            
            self = value
        }
        
        public init(expect: String) throws {
            guard let result = Shape(rawValue: expect) else {
                throw AppError("Unexpected value for Shape: \(expect)")
            }
            self = result
        }
        
    }

    /// Replacement text for use when images are not available. Text. The actual rules are more complicated than indicated.
    public var alt:String?

    /// Coordinates for the shape to be created in an image map. Valid list of floating-point numbers. The actual rules are more complicated than indicated.
    public var coords:[Float]

    /// Whether to download the resource instead of navigating to it, and its file name if so.
    public var download:String?

    /// Address of the hyperlink. Valid URL potentially surrounded by spaces.
    public var href:URL?

    /// URLs to ping. Set of space-separated tokens consisting of valid non-empty URLs.
    public var ping:[URL]

    /// Referrer policy for fetches initiated by the element. Referrer policy.
    public var referrerpolicy:ReferrerPolicy?

    /// Relationship between the location in the document containing the hyperlink and the destination resource. Unordered set of unique space-separated tokens. The actual rules are more complicated than indicated.
    public var rel:[String]

    /// The kind of shape to be created in an image map.
    public var shape:Shape?

    /// Browsing context for hyperlink navigation. Valid browsing context name or keyword.
    public var target:String?


    public init() {
        super.init()
    }

    public init(_ attributes:[String:String], _ parser:XMLParser? = nil) throws {
        var globalAttr = GlobalAttributesBuilder()
        for (key, value) in attributes {
            switch (key) {
                case "alt":
                    alt = value
                case "coords":
                    coords = value
                case "download":
                    download = value
                case "href":
                    href = value
                case "ping":
                    ping = value
                case "referrerpolicy":
                    referrerpolicy = value
                case "rel":
                    rel = value
                case "shape":
                    shape = try Shape(expect: value)
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