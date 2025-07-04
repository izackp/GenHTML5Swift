//
//  Script.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <script> Embedded script
public class Script : NHTMLRenderable, IFlow, IMetaData, IPhrasing, IScriptSupporting {

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

    /// Execute script when available, without blocking while fetching.
    public var async:Bool

    /// How the element handles crossorigin requests.
    public var crossorigin:Crossorigin?

    /// Defer script execution.
    public var defer:Bool

    /// Integrity metadata used in Subresource Integrity checks [SRI].
    public var integrity:String?

    /// Referrer policy for fetches initiated by the element. Referrer policy.
    public var referrerpolicy:ReferrerPolicy?

    /// Address of the resource. Valid non-empty URL potentially surrounded by spaces.
    public var src:URL

    /// Type of script. "module"; a valid MIME type string that is not a JavaScript MIME type essence match.
    public var type:String?


    public init() {
        super.init()
    }

    public init(_ attributes:[String:String], _ parser:XMLParser? = nil) throws {
        var globalAttr = GlobalAttributesBuilder()
        for (key, value) in attributes {
            switch (key) {
                case "async":
                    async = value
                case "crossorigin":
                    crossorigin = try Crossorigin(expect: value)
                case "defer":
                    defer = value
                case "integrity":
                    integrity = value
                case "referrerpolicy":
                    referrerpolicy = value
                case "src":
                    src = value
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
        while let obj = try parser?.readObject(endTag: "script", xmlToHtmlMapper) {
            allItems.append(obj)
        }
        super.init(globalAttr, allItems)
    }


    public func addChild(_ someElement:Script, data, or script documentation) {
        children.append(someElement)
    }
}