//
//  Source.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <source> Image source for img or media source for video or audio
public class Source : NHTMLRenderable {

    /// Applicable media. Valid media query list.
    public var media:String?

    /// Image sizes for different page layouts. Valid source size list.
    public var sizes:[String]

    /// Address of the resource. Valid non-empty URL potentially surrounded by spaces.
    public var src:URL

    /// Images to use in different situations (e.g., high-resolution displays, small monitors, etc.). Comma-separated list of image candidate strings.
    public var srcset:[String]

    /// Type of embedded resource. Valid MIME type string.
    public var type:String?


    public init() {
        super.init()
    }

    public init(_ attributes:[String:String], _ parser:XMLParser? = nil) throws {
        var globalAttr = GlobalAttributesBuilder()
        for (key, value) in attributes {
            switch (key) {
                case "media":
                    media = value
                case "sizes":
                    sizes = value
                case "src":
                    src = value
                case "srcset":
                    srcset = value
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