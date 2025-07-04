//
//  Option.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <option> Option in a list box or combo box control
public class Option : NHTMLRenderable {

    /// Whether the form control is disabled.
    public var disabled:Bool

    /// User-visible label.
    public var label:String?

    /// Whether the option is selected by default.
    public var selected:Bool

    /// Value to be used for form submission.
    public var value:String?


    public init() {
        super.init()
    }

    public init(_ attributes:[String:String], _ parser:XMLParser? = nil) throws {
        var globalAttr = GlobalAttributesBuilder()
        for (key, value) in attributes {
            switch (key) {
                case "disabled":
                    disabled = value
                case "label":
                    label = value
                case "selected":
                    selected = value
                case "value":
                    value = value

                default: break
            }
            if globalAttr.trySetGlobalAttribute(key, value) {
                continue
            }
            throw AppError("Unexpected attribute: \(key)")
        }
        var allItems:[NHTMLRenderable] = []
        while let obj = try parser?.readObject(endTag: "option", xmlToHtmlMapper) {
            allItems.append(obj)
        }
        super.init(globalAttr, allItems)
    }

}