//
//  HSElementType.swift
//  HTMLStandard
//
//  Created by Isaac Paul on 3/13/25.
//

public struct ElementTypes : Codable {
    public let escapable_raw_text_elements: [String] //textarea, title
    public let raw_text_elements: [String] //script, style
    public let the_template_element: [String] //template
    public let void_elements: [String] //area, base ...
    
    enum CodingKeys: String, CodingKey {
        case escapable_raw_text_elements = "escapable-raw-text-elements"
        case raw_text_elements = "raw-text-elements"
        case the_template_element = "the-template-element"
        case void_elements = "void-elements"
    }
    
    public init(from decoder: any Decoder) throws {
        let container: KeyedDecodingContainer<ElementTypes.CodingKeys> = try decoder.container(keyedBy: ElementTypes.CodingKeys.self)
        self.escapable_raw_text_elements = try container.decode([String].self, forKey: ElementTypes.CodingKeys.escapable_raw_text_elements)
        self.raw_text_elements = try container.decode([String].self, forKey: ElementTypes.CodingKeys.raw_text_elements)
        self.the_template_element = try container.decode([String].self, forKey: ElementTypes.CodingKeys.the_template_element)
        self.void_elements = try container.decode([String].self, forKey: ElementTypes.CodingKeys.void_elements)
    }
    
    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: ElementTypes.CodingKeys.self)
        try container.encode(self.escapable_raw_text_elements, forKey: ElementTypes.CodingKeys.escapable_raw_text_elements)
        try container.encode(self.raw_text_elements, forKey: ElementTypes.CodingKeys.raw_text_elements)
        try container.encode(self.the_template_element, forKey: ElementTypes.CodingKeys.the_template_element)
        try container.encode(self.void_elements, forKey: ElementTypes.CodingKeys.void_elements)
    }
}
