//
//  Form.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <form> User-submittable form
public class Form : NHTMLRenderable, IFlow, IPalpable {

    public enum Autocomplete : String, CaseIterable {

        case off
        case on

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
                { throw AppError("Unexpected value for Autocomplete: \(expect)") }
            
            self = value
        }
        
        public init(expect: String) throws {
            guard let result = Autocomplete(rawValue: expect) else {
                throw AppError("Unexpected value for Autocomplete: \(expect)")
            }
            self = result
        }
        
    }

    public enum Enctype : String, CaseIterable {

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
                { throw AppError("Unexpected value for Enctype: \(expect)") }
            
            self = value
        }
        
        public init(expect: String) throws {
            guard let result = Enctype(rawValue: expect) else {
                throw AppError("Unexpected value for Enctype: \(expect)")
            }
            self = result
        }
        
    }

    public enum Method : String, CaseIterable {

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
                { throw AppError("Unexpected value for Method: \(expect)") }
            
            self = value
        }
        
        public init(expect: String) throws {
            guard let result = Method(rawValue: expect) else {
                throw AppError("Unexpected value for Method: \(expect)")
            }
            self = result
        }
        
    }

    /// Character encodings to use for form submission. ASCII case-insensitive match for "UTF-8".
    public var accept-charset:String?

    /// URL to use for form submission. Valid non-empty URL potentially surrounded by spaces.
    public var action:URL

    /// Default setting for autofill feature for controls in the form.
    public var autocomplete:Autocomplete?

    /// Entry list encoding type to use for form submission.
    public var enctype:Enctype?

    /// Variant to use for form submission.
    public var method:Method?

    /// Name of form to use in the document.forms API. Text. The actual rules are more complicated than indicated.
    public var name:String?

    /// Bypass form control validation for form submission.
    public var novalidate:Bool

    /// Browsing context for form submission. Valid browsing context name or keyword.
    public var target:String?


    public init() {
        super.init()
    }

    public init(_ attributes:[String:String], _ parser:XMLParser? = nil) throws {
        var globalAttr = GlobalAttributesBuilder()
        for (key, value) in attributes {
            switch (key) {
                case "accept-charset":
                    accept-charset = value
                case "action":
                    action = value
                case "autocomplete":
                    autocomplete = try Autocomplete(expect: value)
                case "enctype":
                    enctype = try Enctype(expect: value)
                case "method":
                    method = try Method(expect: value)
                case "name":
                    name = value
                case "novalidate":
                    novalidate = value
                case "target":
                    target = value

                default: break
            }
            if globalAttr.trySetGlobalAttribute(key, value) {
                continue
            }
            throw AppError("Unexpected attribute: \(key)")
        }
        var allItems:[NHTMLRenderable] = []
        while let obj = try parser?.readObject(endTag: "form", xmlToHtmlMapper) {
            allItems.append(obj)
        }
        super.init(globalAttr, allItems)
    }


    public func addChild(_ someElement:IFlow) {
        children.append(someElement)
    }
}