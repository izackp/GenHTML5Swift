//
//  XmlToHtmlMapper.swift
//  gen_html
//
//  Created by Isaac Paul on 7/2/25.
//

import Foundation
import HTMLStandard

func writeMapper(to fileOutputDir: URL, _ standard: HTMLStandard) throws {

    var cases = ""
    for (eachKey, _) in standard.elements {
        let typeName = eachKey.uppercaseFirstLetter()
        cases += """
        case "\(eachKey)":
            return try \(typeName)(attributes, parser)
""" + "\n"

    }
    
    let fileName = "XmlToHtmlMapper.swift"
    print("Starting xml mapper \(fileName)")
    let header = Process.genHeader(fileName)
    let body = """
    public func xmlToHtmlMapper(_ name:String, _ attributes:[String:String], _ parser:XMLParser?) throws -> NHTMLRenderable {
        switch name {
            case "head":
                return try Head(attributes, parser)
    \(cases)
            default:
                throw AppError("Unknown or unhandled xml tag: \\(name)")
        }
    }
    """
    
    let fileBody = "\(header)\n\n\(body)"
    print("\(fileName): Body Generated Successfully")

    do {
        let destination = fileOutputDir.appending(path: fileName)
        let strOutput = destination.absoluteString
        print("Determined output: \(strOutput)")
        try fileBody.write(toFile: strOutput, atomically: true, encoding: .utf8)
        print("Successfully Written: \(fileName)")
    } catch {
        print("Unable to generate file for enum \(fileName)\n\(error.localizedDescription)")
    }
}

