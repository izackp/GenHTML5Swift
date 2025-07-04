//
//  Video.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <video> Video player
public class Video : NHTMLRenderable, IEmbedded, IFlow, IInteractive, IPalpable, IPhrasing {

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

    public enum Preload : String, CaseIterable {

        case auto
        case metadata
        case none

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
                { throw AppError("Unexpected value for Preload: \(expect)") }
            
            self = value
        }
        
        public init(expect: String) throws {
            guard let result = Preload(rawValue: expect) else {
                throw AppError("Unexpected value for Preload: \(expect)")
            }
            self = result
        }
        
    }

    /// Hint that the media resource can be started automatically when the page is loaded.
    public var autoplay:Bool

    /// Show user agent controls.
    public var controls:Bool

    /// How the element handles crossorigin requests.
    public var crossorigin:Crossorigin?

    /// Vertical dimension. Valid non-negative integer.
    public var height:UInt?

    /// Whether to loop the media resource.
    public var loop:Bool

    /// Whether to mute the media resource by default.
    public var muted:Bool

    /// Encourage the user agent to display video content within the element's playback area.
    public var playsinline:Bool

    /// Poster frame to show prior to video playback. Valid non-empty URL potentially surrounded by spaces.
    public var poster:URL

    /// Hints how much buffering the media resource will likely need.
    public var preload:Preload?

    /// Address of the resource. Valid non-empty URL potentially surrounded by spaces.
    public var src:URL

    /// Horizontal dimension. Valid non-negative integer.
    public var width:UInt?


    public init() {
        super.init()
    }

    public init(_ attributes:[String:String], _ parser:XMLParser? = nil) throws {
        var globalAttr = GlobalAttributesBuilder()
        for (key, value) in attributes {
            switch (key) {
                case "autoplay":
                    autoplay = value
                case "controls":
                    controls = value
                case "crossorigin":
                    crossorigin = try Crossorigin(expect: value)
                case "height":
                    height = value
                case "loop":
                    loop = value
                case "muted":
                    muted = value
                case "playsinline":
                    playsinline = value
                case "poster":
                    poster = value
                case "preload":
                    preload = try Preload(expect: value)
                case "src":
                    src = value
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
        while let obj = try parser?.readObject(endTag: "video", xmlToHtmlMapper) {
            allItems.append(obj)
        }
        super.init(globalAttr, allItems)
    }

}