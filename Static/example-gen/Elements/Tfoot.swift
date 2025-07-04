//
//  Tfoot.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

/// <tfoot> Group of footer rows in a table
public class Tfoot : NHTMLRenderable {


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
        var allItems:[NHTMLRenderable] = []
        while let obj = try parser?.readObject(endTag: "tfoot", xmlToHtmlMapper) {
            allItems.append(obj)
        }
        super.init(globalAttr, allItems)
    }


    public func addChild(_ someElement:IScriptSupporting) {
        children.append(someElement)
    }
}