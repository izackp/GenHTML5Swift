//
//  Textarea.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <textarea> Multiline text controls
public class Textarea : NHTMLRenderable, IFlow, IFormAssociated, IInteractive, ILabelable, IListed, IPalpable, IPhrasing, IResettable, ISubmittable {

    public enum Wrap : String, CaseIterable {

        case hard
        case soft

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
                { throw AppError("Unexpected value for Wrap: \(expect)") }
            
            self = value
        }
        
        public init(expect: String) throws {
            guard let result = Wrap(rawValue: expect) else {
                throw AppError("Unexpected value for Wrap: \(expect)")
            }
            self = result
        }
        
    }

    /// Maximum number of characters per line. Valid non-negative integer greater than zero.
    public var cols:UInt?

    /// Name of form control to use for sending the element's directionality in form submission. Text. The actual rules are more complicated than indicated.
    public var dirname:String?

    /// Whether the form control is disabled.
    public var disabled:Bool

    /// Associates the element with a form element. ID. The actual rules are more complicated than indicated.
    public var form:String?

    /// Maximum length of value. Valid non-negative integer.
    public var maxlength:UInt?

    /// Minimum length of value. Valid non-negative integer.
    public var minlength:UInt?

    /// Name of the element to use for form submission and in the form.elements API. Text. The actual rules are more complicated than indicated.
    public var name:String?

    /// User-visible label to be placed within the form control. Text. The actual rules are more complicated than indicated.
    public var placeholder:String?

    /// Whether to allow the value to be edited by the user.
    public var readonly:Bool

    /// Whether the control is required for form submission.
    public var required:Bool

    /// Number of lines to show. Valid non-negative integer greater than zero.
    public var rows:UInt?

    /// How the value of the form control is to be wrapped for form submission.
    public var wrap:Wrap?


    public init() {
        super.init()
    }

    public init(_ attributes:[String:String], _ parser:XMLParser? = nil) throws {
        var globalAttr = GlobalAttributesBuilder()
        for (key, value) in attributes {
            switch (key) {
                case "cols":
                    cols = value
                case "dirname":
                    dirname = value
                case "disabled":
                    disabled = value
                case "form":
                    form = value
                case "maxlength":
                    maxlength = value
                case "minlength":
                    minlength = value
                case "name":
                    name = value
                case "placeholder":
                    placeholder = value
                case "readonly":
                    readonly = value
                case "required":
                    required = value
                case "rows":
                    rows = value
                case "wrap":
                    wrap = try Wrap(expect: value)

                default: break
            }
            if globalAttr.trySetGlobalAttribute(key, value) {
                continue
            }
            throw AppError("Unexpected attribute: \(key)")
        }
        var allItems:[NHTMLRenderable] = []
        while let obj = try parser?.readObject(endTag: "textarea", xmlToHtmlMapper) {
            allItems.append(obj)
        }
        super.init(globalAttr, allItems)
    }

}