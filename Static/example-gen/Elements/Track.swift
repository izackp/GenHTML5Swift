//
//  Track.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <track> Timed text track
public class Track : NHTMLRenderable {

    public enum Kind : String, CaseIterable {

        case captions
        case chapters
        case descriptions
        case metadata
        case subtitles

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
                { throw AppError("Unexpected value for Kind: \(expect)") }
            
            self = value
        }
        
        public init(expect: String) throws {
            guard let result = Kind(rawValue: expect) else {
                throw AppError("Unexpected value for Kind: \(expect)")
            }
            self = result
        }
        
    }

    /// Enable the track if no other text track is more suitable.
    public var default:Bool

    /// The type of text track.
    public var kind:Kind?

    /// User-visible label.
    public var label:String?

    /// Address of the resource. Valid non-empty URL potentially surrounded by spaces.
    public var src:URL

    /// Language of the text track. Valid BCP 47 language tag.
    public var srclang:String?


    public init() {
        super.init()
    }

    public init(_ attributes:[String:String], _ parser:XMLParser? = nil) throws {
        var globalAttr = GlobalAttributesBuilder()
        for (key, value) in attributes {
            switch (key) {
                case "default":
                    default = value
                case "kind":
                    kind = try Kind(expect: value)
                case "label":
                    label = value
                case "src":
                    src = value
                case "srclang":
                    srclang = value

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