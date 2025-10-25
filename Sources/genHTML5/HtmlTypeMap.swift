//
//  HtmlTypeMap.swift
//  gen_html
//
//  Created by Isaac Paul on 5/8/25.
//


public enum HtmlTypeMap {
    case text
    case keywords
    case boolean
    case urlList
    case url
    case urlOptional
    case tokenListSpaceSep
    case tokenListCommaSep
    case tokenSet
    case uInt
    case sInt
    case floatList
    case float
    case date
    case srcSizeList //"auto, (max-width: 30em) 100vw, (max-width: 50em) 50vw, calc(33vw - 100px)"
    case mediaList //Need Examp
    case browsingContext
    case referrerPolicy
    case sandbox
    case iframeSrcDoc
    case mimeType
    case inputType
    case csv

    public init?(rawValue: Substring) {
        guard let result = try? HtmlTypeMap.buildFromString(String(rawValue)) else {
            return nil
        }
        self = result
    }
    
    public init?(rawValue: String) {
        guard let result = try? HtmlTypeMap.buildFromString(rawValue) else {
            return nil
        }
        self = result
    }
    
    public init(expect: Substring) throws {
        let result = try HtmlTypeMap.buildFromString(String(expect))
        self = result
    }
    
    public init(expect: String) throws {
        let result = try HtmlTypeMap.buildFromString(expect)
        self = result
    }
    
    static func buildFromString(_ rawValue: String) throws (AppError) -> HtmlTypeMap {
        switch (rawValue) {
            case "Text": return .text
            case "Text. The actual rules are more complicated than indicated": return .text
            case "Keywords": return .keywords
            case "Boolean attribute": return .boolean
            case "Set of space-separated tokens consisting of valid non-empty URLs": return .urlList
            case "Valid non-empty URL potentially surrounded by spaces": return .url
            case "Valid URL potentially surrounded by spaces": return .urlOptional
            case "Set of space-separated tokens": return .tokenListSpaceSep
            case "Ordered set of unique space-separated tokens, case-sensitive, consisting of one code point in length": return .tokenListSpaceSep
            case "Unordered set of unique space-separated tokens, case-sensitive, consisting of valid absolute URL. The actual rules are more complicated than indicated": return .tokenListSpaceSep
            case "Unordered set of unique space-separated tokens, ASCII case-insensitive, consisting of sizes. The actual rules are more complicated than indicated": return .tokenSet
            case "Unordered set of unique space-separated tokens. The actual rules are more complicated than indicated": return .tokenSet
            case "Unordered set of unique space-separated tokens, case-sensitive, consisting of IDs. The actual rules are more complicated than indicated": return .tokenSet
            case "Unordered set of unique space-separated tokens, case-sensitive, consisting of valid absolute URLs, defined property names, or text. The actual rules are more complicated than indicated": return .tokenSet
            case "Valid non-negative integer": return .uInt
            case "Valid non-negative integer greater than zero": return .uInt
            case "Valid integer": return .sInt
            case "Valid list of floating-point numbers. The actual rules are more complicated than indicated": return .floatList
            case "Valid floating-point number": return .float
            case "Valid floating-point number. The actual rules are more complicated than indicated": return .float
            case "Valid date string with optional time": return .date
            case "Valid source size list": return .srcSizeList //"auto, (max-width: 30em) 100vw, (max-width: 50em) 50vw, calc(33vw - 100px)"
            case "Valid media query list": return .mediaList //Need Examp
            case "Valid browsing context name or keyword": return .browsingContext
            case "Referrer policy": return .referrerPolicy
            case "Unordered set of unique space-separated tokens, ASCII case-insensitive, consisting of \"allow-forms\", \"allow-modals\", \"allow-orientation-lock\", \"allow-pointer-lock\", \"allow-popups\", \"allow-popups-to-escape-sandbox\", \"allow-presentation\", \"allow-same-origin\", \"allow-scripts\" and \"allow-top-navigation\"": return .sandbox
            case "The source of an iframe srcdoc document. The actual rules are more complicated than indicated": return .iframeSrcDoc
            case "Valid MIME type string": return .mimeType
            case "input type keyword": return .inputType
            case "Comma-separated list of image candidate strings": return .csv
            case "Valid custom element name of a defined customized built-in element": return .text
            case "Valid BCP 47 language tag": return .text
            case "ID. The actual rules are more complicated than indicated": return .text
            case "Varies. The actual rules are more complicated than indicated": return .text
            case "Regular expression matching the JavaScript Pattern production": return .text
            case "A concrete ARIA role": return .text
            case "An input type e.g. \"text\"": return .text
            case "\"module\"; a valid MIME type string that is not a JavaScript MIME type essence match": return .text
            case "Valid hash-name reference. The actual rules are more complicated than indicated": return .text //expects text with # in front and at least 2 characts incl the hash
            case "Serialized feature policy": return .text
            case "ASCII case-insensitive match for \"UTF-8\"": return .text
            case "Valid month string, valid date string, valid yearless date string, valid time string, valid local date and time string, valid time-zone offset string, valid global date and time string, valid week string, valid non-negative integer, or valid duration string": return .text
            case "Autofill field name and related tokens. The actual rules are more complicated than indicated": return .text
            case "Potential destination, for rel=\"preload\"; script-like destination, for rel=\"modulepreload\"": return .text
            case "Set of comma-separated tokens* consisting of valid MIME type strings with no parameters or audio/*, video/*, or image/. The actual rules are more complicated than indicated": return .tokenListCommaSep
            case "Valid floating-point number greater than zero, or \"any\"": return .float
            case "Valid BCP 47 language tag or the empty string": return .text
            case "CSS declarations. The actual rules are more complicated than indicated": return .text
            default:
                throw AppError("Unexpected value for HtmlTypeMap: \(rawValue)")
        }
    }
    
    static func valueTypeIsDesc(_ valueType:String) -> Bool {
        switch (valueType) {
            case "Text":
                return false
            case "Keywords":
                return false
            case "Boolean attribute":
                return false
            case "":
                return false
            default:
                return true
        }
    }
    
    func typeFrom() -> String {
        switch (self) {
            case .text:
                return "String?"
            case .keywords:
                return "String?"
            case .boolean:
                return "Bool"
            case .urlList:
                return "[URL]"
            case .url:
                return "URL?" //TODO: Shouldn't be optional but we need to modify the initialize to support it.
            case .urlOptional:
                return "URL?"
            case .tokenListSpaceSep:
                return "[String]"
            case .tokenListCommaSep:
                return "[String]"
            case .tokenSet:
                return "[String]" //Swift doesn't have ordered set
            case .uInt:
                return "UInt?"
            case .sInt:
                return "Int?"
            case .floatList:
                return "[Float]" //Maybe double
            case .float:
                return "Float?"
            case .date:
                return "String?"
            case .srcSizeList:
                return "[String]" //Existence of calc makes this more complicated to parse. Same with media condition
            case .mediaList:
                return "String?" //Complex parsing
            case .browsingContext:
                return "String?"
            case .referrerPolicy:
                return "ReferrerPolicy?"
            case .sandbox:
                return "Set<SandboxAttribute>" //Unique and unordered. Case insensitive
            case .iframeSrcDoc:
                return "String?"
            case .mimeType:
                return "String?"
            case .inputType:
                return "InputType?"
            case .csv:
                return "[String]"
        }
    }
    
    func defaultValue() -> String {
        switch (self) {
            case .text:
                return "nil"
            case .keywords:
                return "nil"
            case .boolean:
                return "false"
            case .urlList:
                return "[]"
            case .url:
                return "nil"
            case .urlOptional:
                return "nil"
            case .tokenListCommaSep:
                return "[]"
            case .tokenListSpaceSep:
                return "[]"
            case .tokenSet:
                return "[]"
            case .uInt:
                return "nil"
            case .sInt:
                return "nil"
            case .floatList:
                return "[]"
            case .float:
                return "nil"
            case .date:
                return "nil"
            case .srcSizeList:
                return "[]"
            case .mediaList:
                return "nil"
            case .browsingContext:
                return "nil"
            case .referrerPolicy:
                return "nil"
            case .sandbox:
                return "Set()"
            case .iframeSrcDoc:
                return "nil"
            case .mimeType:
                return "nil"
            case .inputType:
                return "nil"
            case .csv:
                return "[]"
        }
    }
    
    static let parseListCommaSep = "try String.parseList(attValue, \",\")"
    static let parseListSpaceSep = "try String.parseList(attValue, \" \")"
    
    func valueTransform(_ typeName:String = "") -> String {
        switch (self) {
            case .text:
                return "attValue"
            case .keywords:
                return "try \(typeName)(expect: attValue)"
            case .boolean:
                return "true"
            case .urlList:
                return "try URL.parseList(attValue, \" \")"
            case .url:
                return "try URL(expect: attValue)"
            case .urlOptional:
                return "try URL(expect: attValue)"
            case .tokenListCommaSep:
                return "parseListCommaSep"
            case .tokenListSpaceSep:
                return HtmlTypeMap.parseListSpaceSep
            case .tokenSet:
                return HtmlTypeMap.parseListSpaceSep
            case .uInt:
                return "UInt(attValue)"
            case .sInt:
                return "Int(attValue)"
            case .floatList:
                return HtmlTypeMap.parseListCommaSep
            case .float:
                return "Float(attValue)"
            case .date:
                return "attValue"
            case .srcSizeList:
                return HtmlTypeMap.parseListCommaSep
            case .mediaList:
                return "attValue"
            case .browsingContext:
                return "attValue"
            case .referrerPolicy:
                return "try ReferrerPolicy(expect: attValue)"
            case .sandbox:
                return "Set()"
            case .iframeSrcDoc:
                return "attValue"
            case .mimeType:
                return "attValue"
            case .inputType:
                return "try InputType(expect: attValue)"
            case .csv:
                return HtmlTypeMap.parseListCommaSep
        }
    }
}
