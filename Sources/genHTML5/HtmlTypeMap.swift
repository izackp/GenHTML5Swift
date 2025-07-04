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
    case tokenList
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
            case "Set of space-separated tokens": return .tokenList
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
            case "Set of comma-separated tokens* consisting of valid MIME type strings with no parameters or audio/*, video/*, or image/. The actual rules are more complicated than indicated": return .tokenList
            case "Valid floating-point number greater than zero, or \"any\"": return .float
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
                return "URL"
            case .urlOptional:
                return "URL?"
            case .tokenList:
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
    
}
