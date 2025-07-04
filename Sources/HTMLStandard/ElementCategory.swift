//
//  ElementCategory.swift
//  HTMLStandard
//
//  Created by Isaac Paul on 7/2/25.
//

public enum ElementCategory : String, Codable, CaseIterable {
    case flow
    case form_associated = "form-associated"
    case interactive
    case labelable
    case listed
    case palpable
    case phrasing
    case submittable
    case embedded
    case transparent
    case none
    case sectioning_root = "sectioning root"
    case sectioning
    case heading
    case resettable
    case metadata
    case script_supporting = "script-supporting"
    
    public init?(broad: String) {
        switch broad {
            case "metadata content":
                self = .metadata
                return
            case "heading content":
                self = .heading
                return
            case "script-supporting elements":
                self = .script_supporting
                return
            default:
                break
        }
        guard let result = ElementCategory(rawValue: broad) else {
            return nil
        }
        self = result
    }
}
