//
//  Body.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <body> Document body
public class Body : NHTMLRenderable, ISectioningRoot {

    /// event handler.
    public var onafterprint:String?

    /// event handler.
    public var onbeforeprint:String?

    /// event handler.
    public var onbeforeunload:String?

    /// event handler.
    public var onhashchange:String?

    /// event handler.
    public var onlanguagechange:String?

    /// event handler.
    public var onmessage:String?

    /// event handler.
    public var onmessageerror:String?

    /// event handler.
    public var onoffline:String?

    /// event handler.
    public var ononline:String?

    /// event handler.
    public var onpagehide:String?

    /// event handler.
    public var onpageshow:String?

    /// event handler.
    public var onpopstate:String?

    /// event handler.
    public var onrejectionhandled:String?

    /// event handler.
    public var onstorage:String?

    /// event handler.
    public var onunhandledrejection:String?

    /// event handler.
    public var onunload:String?


    public init() {
        super.init()
    }

    public init(_ attributes:[String:String], _ parser:XMLParser? = nil) throws {
        var globalAttr = GlobalAttributesBuilder()
        for (key, value) in attributes {
            switch (key) {
                case "onafterprint":
                    onafterprint = value
                case "onbeforeprint":
                    onbeforeprint = value
                case "onbeforeunload":
                    onbeforeunload = value
                case "onhashchange":
                    onhashchange = value
                case "onlanguagechange":
                    onlanguagechange = value
                case "onmessage":
                    onmessage = value
                case "onmessageerror":
                    onmessageerror = value
                case "onoffline":
                    onoffline = value
                case "ononline":
                    ononline = value
                case "onpagehide":
                    onpagehide = value
                case "onpageshow":
                    onpageshow = value
                case "onpopstate":
                    onpopstate = value
                case "onrejectionhandled":
                    onrejectionhandled = value
                case "onstorage":
                    onstorage = value
                case "onunhandledrejection":
                    onunhandledrejection = value
                case "onunload":
                    onunload = value

                default: break
            }
            if globalAttr.trySetGlobalAttribute(key, value) {
                continue
            }
            throw AppError("Unexpected attribute: \(key)")
        }
        var allItems:[NHTMLRenderable] = []
        while let obj = try parser?.readObject(endTag: "body", xmlToHtmlMapper) {
            allItems.append(obj)
        }
        super.init(globalAttr, allItems)
    }


    public func addChild(_ someElement:IFlow) {
        children.append(someElement)
    }
}