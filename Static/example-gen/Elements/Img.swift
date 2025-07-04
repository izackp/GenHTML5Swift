//
//  Img.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <img> Image
public class Img : NHTMLRenderable, IEmbedded, IFlow, IFormAssociated, IInteractive, IPalpable, IPhrasing {

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

    public enum Decoding : String, CaseIterable {

        case async
        case auto
        case sync

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
                { throw AppError("Unexpected value for Decoding: \(expect)") }
            
            self = value
        }
        
        public init(expect: String) throws {
            guard let result = Decoding(rawValue: expect) else {
                throw AppError("Unexpected value for Decoding: \(expect)")
            }
            self = result
        }
        
    }

    public enum Loading : String, CaseIterable {

        case eager
        case lazy

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
                { throw AppError("Unexpected value for Loading: \(expect)") }
            
            self = value
        }
        
        public init(expect: String) throws {
            guard let result = Loading(rawValue: expect) else {
                throw AppError("Unexpected value for Loading: \(expect)")
            }
            self = result
        }
        
    }

    /// Replacement text for use when images are not available. Text. The actual rules are more complicated than indicated.
    public var alt:String?

    /// How the element handles crossorigin requests.
    public var crossorigin:Crossorigin?

    /// Decoding hint to use when processing this image for presentation.
    public var decoding:Decoding?

    /// Vertical dimension. Valid non-negative integer.
    public var height:UInt?

    /// Whether the image is a server-side image map.
    public var ismap:Bool

    /// Used when determining loading deferral.
    public var loading:Loading?

    /// Referrer policy for fetches initiated by the element. Referrer policy.
    public var referrerpolicy:ReferrerPolicy?

    /// Image sizes for different page layouts. Valid source size list.
    public var sizes:[String]

    /// Address of the resource. Valid non-empty URL potentially surrounded by spaces.
    public var src:URL

    /// Images to use in different situations (e.g., high-resolution displays, small monitors, etc.). Comma-separated list of image candidate strings.
    public var srcset:[String]

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
                case "alt":
                    alt = value
                case "crossorigin":
                    crossorigin = try Crossorigin(expect: value)
                case "decoding":
                    decoding = try Decoding(expect: value)
                case "height":
                    height = value
                case "ismap":
                    ismap = value
                case "loading":
                    loading = try Loading(expect: value)
                case "referrerpolicy":
                    referrerpolicy = value
                case "sizes":
                    sizes = value
                case "src":
                    src = value
                case "srcset":
                    srcset = value
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
        super.init(globalAttr)
    }

}