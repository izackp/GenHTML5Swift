//
//  GenInterfaces.swift
//  gen_html
//
//  Created by Isaac Paul on 7/3/25.
//

import Foundation
import HTMLStandard

func writeInterfacesFile(to fileOutputDir: URL, _ standard: HTMLStandard) throws {

    var cases = ""
    for eachCat in ElementCategory.allCases {
        guard let interfaceName = eachCat.interfaceName() else { continue }
        cases += """
public protocol \(interfaceName) : NHTMLRenderable {}
""" + "\n"

    }
    
    let fileName = "HtmlCategoryInterfaces.swift"
    print("Starting \(fileName)")
    let header = Process.genHeader(fileName)
    let fileBody = "\(header)\n\n\(cases)"
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
