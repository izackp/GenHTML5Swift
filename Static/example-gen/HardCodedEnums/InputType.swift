//
//  InputType.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

public enum InputType : String, CaseIterable {
    

    /// An arbitrary string
    case hidden = "hidden"

    /// A text control containing text with no line breaks
    case text = "text"

    /// A search control containing text with no line breaks
    case search = "search"

    /// A text control containing text with no line breaks
    case tel = "tel"

    /// A text control containing an absolute URL
    case url = "url"

    /// A text control containing an email address or list of email addresses
    case email = "email"

    /// A text control that obscures data entry containing text with no line breaks (sensitive information)
    case password = "password"

    /// A date control containing a date (year, month, day) with no time zone
    case date = "date"

    /// A month control containing a date consisting of a year and a month with no time zone
    case month = "month"

    /// A week control containing a date consisting of a week-year number and a week number with no time zone
    case week = "week"

    /// A time control containing a time (hour, minute, seconds, fractional seconds) with no time zone
    case time = "time"

    /// A date and time control containing a date and time (year, month, day, hour, minute, second, fraction of a second) with no time zone
    case datetimeLocal = "datetime-local"

    /// A text control or spinner control containing a numerical value
    case number = "number"

    /// A slider control or similar containing a numerical value, with the extra semantic that the exact value is not important
    case range = "range"

    /// A color picker containing an sRGB color with 8-bit red, green, and blue components
    case color = "color"

    /// A checkbox containing a set of zero or more values from a predefined list
    case checkbox = "checkbox"

    /// A radio button containing an enumerated value
    case radio = "radio"

    /// A label and a button containing zero or more files each with a MIME type and optionally a filename
    case file = "file"

    /// A button containing an enumerated value, with the extra semantic that it must be the last value selected and initiates form submission
    case submit = "submit"

    /// Either a clickable image, or a button containing a coordinate, relative to a particular image's size, with the extra semantic that it must be the last value selected and initiates form submission
    case image = "image"

    /// A button
    case reset = "reset"

    /// A button
    case button = "button"

    
    public init?(anyCase: String) {
        let lcValue = anyCase.lowercased()
        guard let result = InputType(rawValue: lcValue) else {
            return nil
        }
        self = result
    }
    
    public init(expect: String) throws {
        guard let result = InputType(anyCase: expect) else {
            throw AppError("Unexpected value for Input Type: \(expect)")
        }
        self = result
    }
}