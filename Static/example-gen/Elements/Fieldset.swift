//
//  Fieldset.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <fieldset> Group of form controls
public class Fieldset : NHTMLRenderable, IFlow, IFormAssociated, IListed, IPalpable, ISectioningRoot {

    /// Whether the descendant form controls, except any inside legend, are disabled.
    public var disabled:Bool

    /// Associates the element with a form element. ID. The actual rules are more complicated than indicated.
    public var form:String?

    /// Name of the element to use for form submission and in the form.elements API. Text. The actual rules are more complicated than indicated.
    public var name:String?


    public init() {
        super.init()
    }

    public init(_ attributes:[String:String], _ parser:XMLParser? = nil) throws {
        var globalAttr = GlobalAttributesBuilder()
        for (key, value) in attributes {
            switch (key) {
                case "disabled":
                    disabled = value
                case "form":
                    form = value
                case "name":
                    name = value

                default: break
            }
            if globalAttr.trySetGlobalAttribute(key, value) {
                continue
            }
            throw AppError("Unexpected attribute: \(key)")
        }
        var allItems:[NHTMLRenderable] = []
        while let obj = try parser?.readObject(endTag: "fieldset", xmlToHtmlMapper) {
            allItems.append(obj)
        }
        super.init(globalAttr, allItems)
    }


    public func addChild(_ someElement:IFlow) {
        children.append(someElement)
    }
}