//
//  Wbr.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <wbr> Line breaking opportunity
public class Wbr : NHTMLRenderable, IFlow, IPhrasing {


    public init() {
        super.init()
    }

    public init(_ attributes:[String:String], _ parser:XMLParser? = nil) throws {
        var globalAttr = GlobalAttributesBuilder()
        for (key, value) in attributes {
            switch (key) {

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