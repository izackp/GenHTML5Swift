//
//  Iframe.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <iframe> Nested browsing context
public class Iframe : NHTMLRenderable, IEmbedded, IFlow, IInteractive, IPalpable, IPhrasing {

    /// Feature policy to be applied to the iframe's contents. Serialized feature policy.
    public var allow:String?

    /// Whether to allow the iframe's contents to use requestFullscreen().
    public var allowfullscreen:Bool

    /// Whether the iframe's contents are allowed to use the PaymentRequest interface to make payment requests.
    public var allowpaymentrequest:Bool

    /// Vertical dimension. Valid non-negative integer.
    public var height:UInt?

    /// Name of nested browsing context. Valid browsing context name or keyword.
    public var name:String?

    /// Referrer policy for fetches initiated by the element. Referrer policy.
    public var referrerpolicy:ReferrerPolicy?

    /// Security rules for nested content. Unordered set of unique space-separated tokens, ASCII case-insensitive, consisting of "allow-forms", "allow-modals", "allow-orientation-lock", "allow-pointer-lock", "allow-popups", "allow-popups-to-escape-sandbox", "allow-presentation", "allow-same-origin", "allow-scripts" and "allow-top-navigation".
    public var sandbox:Set<SandboxAttribute>

    /// Address of the resource. Valid non-empty URL potentially surrounded by spaces.
    public var src:URL

    /// A document to render in the iframe. The source of an iframe srcdoc document. The actual rules are more complicated than indicated.
    public var srcdoc:String?

    /// Horizontal dimension. Valid non-negative integer.
    public var width:UInt?


    public init() {
        super.init()
    }

    public init(_ attributes:[String:String], _ parser:XMLParser? = nil) throws {
        var globalAttr = GlobalAttributesBuilder()
        for (key, value) in attributes {
            switch (key) {
                case "allow":
                    allow = value
                case "allowfullscreen":
                    allowfullscreen = value
                case "allowpaymentrequest":
                    allowpaymentrequest = value
                case "height":
                    height = value
                case "name":
                    name = value
                case "referrerpolicy":
                    referrerpolicy = value
                case "sandbox":
                    sandbox = value
                case "src":
                    src = value
                case "srcdoc":
                    srcdoc = value
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
        while let obj = try parser?.readObject(endTag: "iframe", xmlToHtmlMapper) {
            allItems.append(obj)
        }
        super.init(globalAttr, allItems)
    }

}