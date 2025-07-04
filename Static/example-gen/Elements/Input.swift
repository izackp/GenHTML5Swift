//
//  Input.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <input> Form control
public class Input : NHTMLRenderable, IFlow, IFormAssociated, IInteractive, ILabelable, IListed, IPalpable, IPhrasing, IResettable, ISubmittable {

    public enum Formenctype : String, CaseIterable {

        case application/xWwwFormUrlencoded = "application/x-www-form-urlencoded"
        case multipart/formData = "multipart/form-data"
        case text/plain

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
                { throw AppError("Unexpected value for Formenctype: \(expect)") }
            
            self = value
        }
        
        public init(expect: String) throws {
            guard let result = Formenctype(rawValue: expect) else {
                throw AppError("Unexpected value for Formenctype: \(expect)")
            }
            self = result
        }
        
    }

    public enum Formmethod : String, CaseIterable {

        case GET
        case POST
        case dialog

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
                { throw AppError("Unexpected value for Formmethod: \(expect)") }
            
            self = value
        }
        
        public init(expect: String) throws {
            guard let result = Formmethod(rawValue: expect) else {
                throw AppError("Unexpected value for Formmethod: \(expect)")
            }
            self = result
        }
        
    }

    /// Hint for expected file type in file upload controls. Set of comma-separated tokens* consisting of valid MIME type strings with no parameters or audio/*, video/*, or image/. The actual rules are more complicated than indicated.
    public var accept:[String]

    /// Replacement text for use when images are not available. Text. The actual rules are more complicated than indicated.
    public var alt:String?

    /// Hint for form autofill feature. Autofill field name and related tokens. The actual rules are more complicated than indicated.
    public var autocomplete:String?

    /// Whether the control is checked.
    public var checked:Bool

    /// Name of form control to use for sending the element's directionality in form submission. Text. The actual rules are more complicated than indicated.
    public var dirname:String?

    /// Whether the form control is disabled.
    public var disabled:Bool

    /// Associates the element with a form element. ID. The actual rules are more complicated than indicated.
    public var form:String?

    /// URL to use for form submission. Valid non-empty URL potentially surrounded by spaces.
    public var formaction:URL

    /// Entry list encoding type to use for form submission.
    public var formenctype:Formenctype?

    /// Variant to use for form submission.
    public var formmethod:Formmethod?

    /// Bypass form control validation for form submission.
    public var formnovalidate:Bool

    /// Browsing context for form submission. Valid browsing context name or keyword.
    public var formtarget:String?

    /// Vertical dimension. Valid non-negative integer.
    public var height:UInt?

    /// List of autocomplete options. ID. The actual rules are more complicated than indicated.
    public var list:String?

    /// Maximum value. Varies. The actual rules are more complicated than indicated.
    public var max:String?

    /// Maximum length of value. Valid non-negative integer.
    public var maxlength:UInt?

    /// Minimum value. Varies. The actual rules are more complicated than indicated.
    public var min:String?

    /// Minimum length of value. Valid non-negative integer.
    public var minlength:UInt?

    /// Whether to allow multiple values.
    public var multiple:Bool

    /// Name of the element to use for form submission and in the form.elements API. Text. The actual rules are more complicated than indicated.
    public var name:String?

    /// Pattern to be matched by the form control's value. Regular expression matching the JavaScript Pattern production.
    public var pattern:String?

    /// User-visible label to be placed within the form control. Text. The actual rules are more complicated than indicated.
    public var placeholder:String?

    /// Whether to allow the value to be edited by the user.
    public var readonly:Bool

    /// Whether the control is required for form submission.
    public var required:Bool

    /// Size of the control. Valid non-negative integer greater than zero.
    public var size:UInt?

    /// Address of the resource. Valid non-empty URL potentially surrounded by spaces.
    public var src:URL

    /// Granularity to be matched by the form control's value. Valid floating-point number greater than zero, or "any".
    public var step:Float?

    /// Description of pattern (when used with pattern attribute).
    public var title:String?

    ///  Type of form control or Type of form control. input type keyword or An input type e.g. "text"
    public var type:String?

    /// Value of the form control. Varies. The actual rules are more complicated than indicated.
    public var value:String?

    /// Horizontal dimension. Valid non-negative integer.
    public var width:UInt?


    public init() {
        super.init()
    }

    public init(_ attributes:[String:String], _ parser:XMLParser? = nil) throws {
        var globalAttr = GlobalAttributesBuilder()
        for (key, value) in attributes {
            switch (key) {
                case "accept":
                    accept = value
                case "alt":
                    alt = value
                case "autocomplete":
                    autocomplete = value
                case "checked":
                    checked = value
                case "dirname":
                    dirname = value
                case "disabled":
                    disabled = value
                case "form":
                    form = value
                case "formaction":
                    formaction = value
                case "formenctype":
                    formenctype = try Formenctype(expect: value)
                case "formmethod":
                    formmethod = try Formmethod(expect: value)
                case "formnovalidate":
                    formnovalidate = value
                case "formtarget":
                    formtarget = value
                case "height":
                    height = value
                case "list":
                    list = value
                case "max":
                    max = value
                case "maxlength":
                    maxlength = value
                case "min":
                    min = value
                case "minlength":
                    minlength = value
                case "multiple":
                    multiple = value
                case "name":
                    name = value
                case "pattern":
                    pattern = value
                case "placeholder":
                    placeholder = value
                case "readonly":
                    readonly = value
                case "required":
                    required = value
                case "size":
                    size = value
                case "src":
                    src = value
                case "step":
                    step = value
                case "title":
                    title = value
                case "type":
                    type = value
                case "value":
                    value = value
                case "width":
                    width = value

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