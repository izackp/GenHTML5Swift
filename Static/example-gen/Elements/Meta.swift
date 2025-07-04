//
//  Meta.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <meta> Text metadata
public class Meta : NHTMLRenderable, IFlow, IMetaData, IPhrasing {

    public enum Charset : String, CaseIterable {

        case utf8 = "utf-8"

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
                { throw AppError("Unexpected value for Charset: \(expect)") }
            
            self = value
        }
        
        public init(expect: String) throws {
            guard let result = Charset(rawValue: expect) else {
                throw AppError("Unexpected value for Charset: \(expect)")
            }
            self = result
        }
        
    }

    public enum Http-equiv : String, CaseIterable {

        case contentSecurityPolicy = "content-security-policy"
        case contentType = "content-type"
        case defaultStyle = "default-style"
        case refresh
        case xUaCompatible = "x-ua-compatible"

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
                { throw AppError("Unexpected value for Http-equiv: \(expect)") }
            
            self = value
        }
        
        public init(expect: String) throws {
            guard let result = Http-equiv(rawValue: expect) else {
                throw AppError("Unexpected value for Http-equiv: \(expect)")
            }
            self = result
        }
        
    }

    /// Character encoding declaration.
    public var charset:Charset?

    /// Value of the element. Text. The actual rules are more complicated than indicated.
    public var content:String?

    /// Pragma directive.
    public var http-equiv:Http-equiv?

    /// Metadata name. Text. The actual rules are more complicated than indicated.
    public var name:String?


    public init() {
        super.init()
    }

    public init(_ attributes:[String:String], _ parser:XMLParser? = nil) throws {
        var globalAttr = GlobalAttributesBuilder()
        for (key, value) in attributes {
            switch (key) {
                case "charset":
                    charset = try Charset(expect: value)
                case "content":
                    content = value
                case "http-equiv":
                    http-equiv = try Http-equiv(expect: value)
                case "name":
                    name = value

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