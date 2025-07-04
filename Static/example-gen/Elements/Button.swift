//
//  Button.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <button> Button control
public class Button : NHTMLRenderable, IFlow, IFormAssociated, IInteractive, ILabelable, IListed, IPalpable, IPhrasing, ISubmittable {

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

    public enum Type : String, CaseIterable {

        case button
        case reset
        case submit

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
                { throw AppError("Unexpected value for Type: \(expect)") }
            
            self = value
        }
        
        public init(expect: String) throws {
            guard let result = Type(rawValue: expect) else {
                throw AppError("Unexpected value for Type: \(expect)")
            }
            self = result
        }
        
    }

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

    /// Name of the element to use for form submission and in the form.elements API. Text. The actual rules are more complicated than indicated.
    public var name:String?

    /// Type of button.
    public var type:Type?

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
                case "name":
                    name = value
                case "type":
                    type = try Type(expect: value)
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
        while let obj = try parser?.readObject(endTag: "button", xmlToHtmlMapper) {
            allItems.append(obj)
        }
        super.init(globalAttr, allItems)
    }


    public func addChild(_ someElement:IPhrasing) {
        children.append(someElement)
    }
}