//
//  HardCodedEnums.swift
//  gen_html
//
//  Created by Isaac Paul on 7/2/25.
//

import Foundation

struct HTMLEnum {
    let name: String
    let displayName: String
    let allowAnyCase: Bool
    let values: [ValueTransform]
    
    func generateCases() -> String {
        var cases = ""
        for eachValue in values {
            if let help = eachValue.help {
                
                cases += "\n    /// \(help)\n"
            }
            cases += "    case \(eachValue.swiftName) = \"\(eachValue.name)\"\n"
        }
        return cases
    }
    
    func generateSwiftCode() -> String {
        if (allowAnyCase) {
            return generateSwiftCodeAnyCase()
        }
        
        return """
public enum \(name) : String, CaseIterable {
    
\(generateCases())
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
            { throw AppError("Unexpected value for \(displayName): \\(expect)") }
        
        self = value
    }
    
    public init(expect: String) throws {
        guard let result = \(name)(rawValue: expect) else {
            throw AppError("Unexpected value for \(displayName): \\(expect)")
        }
        self = result
    }
}
"""
    }
    
    func generateSwiftCodeAnyCase() -> String {
        return """
public enum \(name) : String, CaseIterable {
    
\(generateCases())
    
    public init?(anyCase: String) {
        let lcValue = anyCase.lowercased()
        guard let result = \(name)(rawValue: lcValue) else {
            return nil
        }
        self = result
    }
    
    public init(expect: String) throws {
        guard let result = \(name)(anyCase: expect) else {
            throw AppError("Unexpected value for \(displayName): \\(expect)")
        }
        self = result
    }
}
"""
    }
}


let builtInEnums = [
    HTMLEnum(name: "ReferrerPolicy", displayName: "Referrer Policy", allowAnyCase: true, values: [
        ValueTransform(name: "noReferrer",                  swiftName: "no-referrer"),
        ValueTransform(name: "noReferrerWhenDowngrade",     swiftName: "no-referrer-when-downgrade"),
        ValueTransform(name: "sameOrigin",                  swiftName: "same-origin"),
        ValueTransform(name: "origin",                      swiftName: "origin"),
        ValueTransform(name: "strictOrigin",                swiftName: "strict-origin"),
        ValueTransform(name: "originWhenCrossOrigin",       swiftName: "origin-when-cross-origin"),
        ValueTransform(name: "strictOriginWhenCrossOrigin", swiftName: "strict-origin-when-cross-origin"),
        ValueTransform(name: "unsafeUrl",                   swiftName: "unsafe-url"),
    ]),
    HTMLEnum(name: "SandboxAttribute", displayName: "Sandbox Attribute", allowAnyCase: true, values: [
        ValueTransform(name: "allowDownloads",                      swiftName: "allow-downloads"),
        ValueTransform(name: "allowForms",                          swiftName: "allow-forms"),
        ValueTransform(name: "allowModals",                         swiftName: "allow-modals"),
        ValueTransform(name: "allowOrientationLock",                swiftName: "allow-orientation-lock"),
        ValueTransform(name: "allowPointerLock",                    swiftName: "allow-pointer-lock"),
        ValueTransform(name: "allowPopups",                         swiftName: "allow-popups"),
        ValueTransform(name: "allowPopupsToEscapeSandbox",          swiftName: "allow-popups-to-escape-sandbox"),
        ValueTransform(name: "allowPresentation",                   swiftName: "allow-presentation"),
        ValueTransform(name: "allowSameOrigin",                     swiftName: "allow-same-origin"),
        ValueTransform(name: "allowScripts",                        swiftName: "allow-scripts"),
        ValueTransform(name: "allowTopNavigation",                  swiftName: "allow-top-navigation"),
        ValueTransform(name: "allowTopNavigationByUserActivation",  swiftName: "allow-top-navigation-by-user-activation"),
        ValueTransform(name: "allowTopNavigationToCustomProtocols", swiftName: "allow-top-navigation-to-custom-protocols"),
    ]),
    HTMLEnum(name: "InputType", displayName: "Input Type", allowAnyCase: true, values: [
        ValueTransform(name: "hidden",          swiftName: "hidden",        help: "An arbitrary string"),
        ValueTransform(name: "text",            swiftName: "text",          help: "A text control containing text with no line breaks"),
        ValueTransform(name: "search",          swiftName: "search",        help: "A search control containing text with no line breaks"),
        ValueTransform(name: "tel",             swiftName: "tel",           help: "A text control containing text with no line breaks"),
        ValueTransform(name: "url",             swiftName: "url",           help: "A text control containing an absolute URL"),
        ValueTransform(name: "email",           swiftName: "email",         help: "A text control containing an email address or list of email addresses"),
        ValueTransform(name: "password",        swiftName: "password",      help: "A text control that obscures data entry containing text with no line breaks (sensitive information)"),
        ValueTransform(name: "date",            swiftName: "date",          help: "A date control containing a date (year, month, day) with no time zone"),
        ValueTransform(name: "month",           swiftName: "month",         help: "A month control containing a date consisting of a year and a month with no time zone"),
        ValueTransform(name: "week",            swiftName: "week",          help: "A week control containing a date consisting of a week-year number and a week number with no time zone"),
        ValueTransform(name: "time",            swiftName: "time",          help: "A time control containing a time (hour, minute, seconds, fractional seconds) with no time zone"),
        ValueTransform(name: "datetime-local",  swiftName: "datetimeLocal", help: "A date and time control containing a date and time (year, month, day, hour, minute, second, fraction of a second) with no time zone"),
        ValueTransform(name: "number",          swiftName: "number",        help: "A text control or spinner control containing a numerical value"),
        ValueTransform(name: "range",           swiftName: "range",         help: "A slider control or similar containing a numerical value, with the extra semantic that the exact value is not important"),
        ValueTransform(name: "color",           swiftName: "color",         help: "A color picker containing an sRGB color with 8-bit red, green, and blue components"),
        ValueTransform(name: "checkbox",        swiftName: "checkbox",      help: "A checkbox containing a set of zero or more values from a predefined list"),
        ValueTransform(name: "radio",           swiftName: "radio",         help: "A radio button containing an enumerated value"),
        ValueTransform(name: "file",            swiftName: "file",          help: "A label and a button containing zero or more files each with a MIME type and optionally a filename"),
        ValueTransform(name: "submit",          swiftName: "submit",        help: "A button containing an enumerated value, with the extra semantic that it must be the last value selected and initiates form submission"),
        ValueTransform(name: "image",           swiftName: "image",         help: "Either a clickable image, or a button containing a coordinate, relative to a particular image's size, with the extra semantic that it must be the last value selected and initiates form submission"),
        ValueTransform(name: "reset",           swiftName: "reset",         help: "A button"),
        ValueTransform(name: "button",          swiftName: "button",        help: "A button")
    ])
]

func writeEnums(to fileOutputDir: URL) throws {
    let out = fileOutputDir.appending(path: "HardCodedEnums")
    let fm = FileManager.default
    if (fm.fileExists(atPath: out.path()) == false) {
        print("Creating Directory: \(out.path())")
        try fm.createDirectory(atPath: out.path(), withIntermediateDirectories: true)
    }
    for eachEnum in builtInEnums {
        let enumName = eachEnum.name
        do {
            print("Starting enum \(enumName)")
            let fileName = "\(enumName).swift"
            let header = Process.genHeader(fileName)
            let fileBody = "\(header)\n\n\(eachEnum.generateSwiftCode())"
            print("\(enumName): Body Generated Successfully")
            let destination = out.appending(path: fileName)
            let strOutput = destination.absoluteString
            print("Determined output: \(strOutput)")
            try fileBody.write(toFile: strOutput, atomically: true, encoding: .utf8)
            print("Successfully Written: \(fileName)")
        } catch {
            print("Unable to generate file for enum \(enumName)\n\(error.localizedDescription)")
        }
    }
}
