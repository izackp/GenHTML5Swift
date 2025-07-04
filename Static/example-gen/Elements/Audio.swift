//
//  Audio.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <audio> Audio player
public class Audio : NHTMLRenderable, IEmbedded, IFlow, IInteractive, IPalpable, IPhrasing {

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

    /// Whether to loop the media resource.
    public var loop:Bool

    /// Whether to mute the media resource by default.
    public var muted:Bool

    /// Hints how much buffering the media resource will likely need.
    public var preload:Preload?

    /// Address of the resource. Valid non-empty URL potentially surrounded by spaces.
    public var src:URL


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
                case "loop":
                    loop = value
                case "muted":
                    muted = value
                case "preload":
                    preload = try Preload(expect: value)
                case "src":
                    src = value

                default: break
            }
            if globalAttr.trySetGlobalAttribute(key, value) {
                continue
            }
            throw AppError("Unexpected attribute: \(key)")
        }
        var allItems:[NHTMLRenderable] = []
        while let obj = try parser?.readObject(endTag: "audio", xmlToHtmlMapper) {
            allItems.append(obj)
        }
        super.init(globalAttr, allItems)
    }

}