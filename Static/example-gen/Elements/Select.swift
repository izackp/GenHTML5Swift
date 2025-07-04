//
//  Select.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <select> List box control
public class Select : NHTMLRenderable, IFlow, IFormAssociated, IInteractive, ILabelable, IListed, IPalpable, IPhrasing, IResettable, ISubmittable {

    /// Hint for form autofill feature. Autofill field name and related tokens. The actual rules are more complicated than indicated.
    public var autocomplete:String?

    /// Whether the form control is disabled.
    public var disabled:Bool

    /// Associates the element with a form element. ID. The actual rules are more complicated than indicated.
    public var form:String?

    /// Whether to allow multiple values.
    public var multiple:Bool

    /// Name of the element to use for form submission and in the form.elements API. Text. The actual rules are more complicated than indicated.
    public var name:String?

    /// Whether the control is required for form submission.
    public var required:Bool

    /// Size of the control. Valid non-negative integer greater than zero.
    public var size:UInt?


    public init() {
        super.init()
    }

    public init(_ attributes:[String:String], _ parser:XMLParser? = nil) throws {
        var globalAttr = GlobalAttributesBuilder()
        for (key, value) in attributes {
            switch (key) {
                case "autocomplete":
                    autocomplete = value
                case "disabled":
                    disabled = value
                case "form":
                    form = value
                case "multiple":
                    multiple = value
                case "name":
                    name = value
                case "required":
                    required = value
                case "size":
                    size = value

                default: break
            }
            if globalAttr.trySetGlobalAttribute(key, value) {
                continue
            }
            throw AppError("Unexpected attribute: \(key)")
        }
        var allItems:[NHTMLRenderable] = []
        while let obj = try parser?.readObject(endTag: "select", xmlToHtmlMapper) {
            allItems.append(obj)
        }
        super.init(globalAttr, allItems)
    }


    public func addChild(_ someElement:IScriptSupporting) {
        children.append(someElement)
    }
}