//
//  Meter.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <meter> Gauge
public class Meter : NHTMLRenderable, IFlow, ILabelable, IPalpable, IPhrasing {

    /// Low limit of high range. Valid floating-point number. The actual rules are more complicated than indicated.
    public var high:Float?

    /// High limit of low range. Valid floating-point number. The actual rules are more complicated than indicated.
    public var low:Float?

    /// Upper bound of range. Valid floating-point number. The actual rules are more complicated than indicated.
    public var max:Float?

    /// Lower bound of range. Valid floating-point number. The actual rules are more complicated than indicated.
    public var min:Float?

    /// Optimum value in gauge. Valid floating-point number. The actual rules are more complicated than indicated.
    public var optimum:Float?

    /// Current value of the element. Valid floating-point number.
    public var value:Float?


    public init() {
        super.init()
    }

    public init(_ attributes:[String:String], _ parser:XMLParser? = nil) throws {
        var globalAttr = GlobalAttributesBuilder()
        for (key, value) in attributes {
            switch (key) {
                case "high":
                    high = value
                case "low":
                    low = value
                case "max":
                    max = value
                case "min":
                    min = value
                case "optimum":
                    optimum = value
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
        while let obj = try parser?.readObject(endTag: "meter", xmlToHtmlMapper) {
            allItems.append(obj)
        }
        super.init(globalAttr, allItems)
    }


    public func addChild(_ someElement:IPhrasing) {
        children.append(someElement)
    }
}