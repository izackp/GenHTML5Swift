//
//  swift
//  Plot
//
//  Created by Isaac Paul on 3/13/25.
//

import Foundation

fileprivate let fileNameAttr = "attributes.json"
fileprivate let fileNameCat = "categories.json"
fileprivate let fileNameElemType = "element-types.json"
fileprivate let fileNameElem = "elements.json"
fileprivate let fileEventHand = "event-handlers.json"

public class HTMLStandard {

    public let attributes: [String: AttributeDef]
    public let categories: [String: CategoryDef]
    public let elementTypes: ElementTypes
    public let elements: [String: ElementDef]
    public let eventHandlers: [String : EventHandlerDef]
    
    public init(attributes: [String : AttributeDef], categories: [String : CategoryDef], elementTypes: ElementTypes, elements: [String : ElementDef], eventHandlers: [String : EventHandlerDef]) {
        self.attributes = attributes
        self.categories = categories
        self.elementTypes = elementTypes
        self.elements = elements
        self.eventHandlers = eventHandlers
    }
    
    public static func readFromFilesIn(_ url:URL) throws -> HTMLStandard {
        let jsonDecoder = JSONDecoder()
        let attributesUrl = url.appending(path:fileNameAttr, directoryHint: .notDirectory)
        let attributes: [String: AttributeDef] = try readTypedDic(attributesUrl, jsonDecoder)
        
        let categoriesUrl = url.appending(path:fileNameCat, directoryHint: .notDirectory)
        let categories: [String: CategoryDef] = try readTypedDic(categoriesUrl, jsonDecoder)
        
        let elementTypeUrl = url.appending(path:fileNameElemType, directoryHint: .notDirectory)
        let elementTypes: ElementTypes = try readElementTypes(elementTypeUrl, jsonDecoder)
        
        let elementsUrl = url.appending(path:fileNameElem, directoryHint: .notDirectory)
        let elements: [String: ElementDef] = try readTypedDic(elementsUrl, jsonDecoder)
        
        let eventHandlersUrl = url.appending(path:fileEventHand, directoryHint: .notDirectory)
        let eventHandlers: [String: EventHandlerDef] = try readTypedDic(eventHandlersUrl, jsonDecoder)
        
        return HTMLStandard(attributes: attributes, categories: categories, elementTypes: elementTypes, elements: elements, eventHandlers: eventHandlers)
        
    }
    
    static func readTypedDic<T:Decodable>(_ url: URL, _ jsonDecoder:JSONDecoder = JSONDecoder()) throws -> [String: T] {
        let inputHandle = try FileHandle(forReadingFrom: url)
        guard let data = try inputHandle.readAllData() else {
            throw AppError("Empty input.")
        }
        let filteredDic = try jsonDecoder.decode(FilteredDictionary<T>.self, from: data)
        let resultDic = filteredDic.content
        return resultDic
    }
    
    static func readElementTypes(_ url: URL, _ jsonDecoder:JSONDecoder = JSONDecoder()) throws -> ElementTypes {
        let inputHandle = try FileHandle(forReadingFrom: url)
        guard let data = try inputHandle.readAllData() else {
            throw AppError("Empty input.")
        }
        let result = try jsonDecoder.decode(ElementTypes.self, from: data)
        return result
    }
    
    //Title, Link - Has two possible attributes
    public func fetchAttribute(_ name:String, _ matchingElement:String) throws -> [Attribute] {
        var result:[Attribute] = []
        var next:String? = name
        while let nextName = next {
            guard let nextDef = attributes[nextName] else {
                if (nextName == "per [SVG]" || nextName == "per [MATHML]" || nextName == "any") {
                    break
                }
                if let idk = eventHandlers[nextName] {
                    if (idk.applies_to == matchingElement || idk.applies_to == "HTML elements") {
                        result.append(Attribute(name: name, indexName: nextName, definition: AttributeDef(desc: "event handler", next: nil, elements: [idk.applies_to], value_keywords: [], value_type: "Text") ))
                        break
                    }
                }
                throw AppError("Expected attribute \(nextName) doesn't exist.")
            }
            if (nextDef.elements.contains(matchingElement)) {
                result.append(Attribute(name: name, indexName: nextName, definition: nextDef ))
            }
            next = nextDef.next
        }
        if (result.count == 0) { //NOTE: Global attributes may apply but I'm assuming their meaning changes 100% of the time if there is a matching attribute
            if let def = attributes[name] {
                let element = def.elements.first ?? ""
                if (element == "HTML") {
                    result.append(Attribute(name: name, indexName: name, definition: def ))
                }
            }
        }
        return result
    }
    
    public func fetchAttribute(_ name:String) throws -> [Attribute] {
        
        guard let def = attributes[name] else {
            throw AppError("Attribute \(name) doesn't exist.")
        }
        var result:[Attribute] = [Attribute(name: name, indexName: name, definition: def)]
        var next = def.next
        while let nextName = next {
            guard let nextDef = attributes[nextName] else {
                if (nextName == "per [SVG]" || nextName == "per [MATHML]" || nextName == "any") {
                    break
                }
                if let idk = eventHandlers[nextName] {
                    if (idk.applies_to == "HTML elements") {
                        result.append(Attribute(name: name, indexName: nextName, definition: AttributeDef(desc: "event handler", next: nil, elements: [idk.applies_to], value_keywords: [], value_type: "Text") ))
                        break
                    }
                }
                throw AppError("Expected attribute \(name) doesn't exist.")
            }
            result.append(Attribute(name: name, indexName: nextName, definition: nextDef))
            next = nextDef.next
        }
        return result
    }
    
    public func fetchAttributeDef(_ name:String) throws -> AttributeDef {
        guard let def = attributes[name] else {
            throw AppError("Attribute \(name) doesn't exist.")
        }
        return def
    }
    
    public func fetchCategory(_ name:String) throws -> Category {
        guard let def = categories[name] else {
            throw AppError("Category \(name) doesn't exist.")
        }
        return Category(name: name, definition: def)
    }
    
    public func fetchCategoryDef(_ name:String) throws -> CategoryDef {
        guard let def = categories[name] else {
            throw AppError("Category \(name) doesn't exist.")
        }
        return def
    }
    
    public func fetchElement(_ name:String) throws -> Element {
        guard let def = elements[name] else {
            throw AppError("Element \(name) doesn't exist.")
        }
        return Element(name: name, definition: def)
    }
    
    public func fetchElementDef(_ name:String) throws -> ElementDef {
        guard let def = elements[name] else {
            throw AppError("Element \(name) doesn't exist.")
        }
        return def
    }
}
