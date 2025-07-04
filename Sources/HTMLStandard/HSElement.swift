//
//  HSElement.swift
//  HTMLStandard
//
//  Created by Isaac Paul on 3/13/25.
//

public struct Element {
    public let name: String
    public let definition: ElementDef
}

public struct ElementDef : Codable {
    public let attributes: [String]
    public let categories: [ElementCategory]
    public let children: [String]
    public let desc: String
    /*
    private var _childrenCategories: [HtmlCategory] = []
    private var _childrenElements: [String] = []
    
    mutating private func updateCache() {
        let (newCat, newElem) = buildChildrenInfo()
        _childrenCategories = newCat
        _childrenElements = newElem
    }
    
    mutating public func childrenCategories() -> [HtmlCategory] {
        if (_childrenCategories.isEmpty) {
            updateCache()
        }
        return _childrenCategories
    }
    
    mutating public func childrenElements() -> [String] {
        if (_childrenElements.isEmpty) {
            updateCache()
        }
        return _childrenElements
    }*/
    
    public func buildChildrenInfo() -> ([ElementCategory], [String]) {
        var newCat:[ElementCategory] = []
        var newElem:[String] = []
        for eachChild in children {
            if let cat = ElementCategory(broad: eachChild) {
                newCat.append(cat)
            } else if (eachChild == "one img") {
                newElem.append("img")
            } else if (eachChild.firstIndex(of: " ") != nil) {
                newElem.append(eachChild)
            }
        }
        return (newCat, newElem)
    }
}
