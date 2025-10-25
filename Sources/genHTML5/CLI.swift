//#!/usr/env/swift

import Foundation
import ArgumentParser
import HTMLStandard

@available(macOS 10.15.4, *)
struct Process: AsyncParsableCommand {
    
    static let configuration = CommandConfiguration(
            abstract: "A utility to generate Swift HTML5 classes from the spec",
            version: "0.0.1")
    
    
    @Flag(name:[.customShort("f"), .long], help: "Automatically overwrite existing files")
    var overwrite: Bool = false
    
    @Option(name:[.customShort("i"), .customLong("input")], help: "Path to folder with files", completion: .file(), transform: URL.init(fileURLWithPath:))
    var inputFilePath: URL? = nil
    
    @Option(name:[.customShort("o"), .customLong("output")], help: "Destination to write output", completion: .file(), transform: URL.init(fileURLWithPath:))
    var outputFilePath: URL? = nil
    
    func inputFileDirectory() throws -> URL {
        if let inputFilePath = inputFilePath {
            return inputFilePath
        }
        guard let workingDirUrl = URL(string: CLI.workingDirectory) else {
            throw AppError("Error: could not convert \(CLI.workingDirectory) to a url.")
        }
        let parentDirectory = workingDirUrl.deletingLastPathComponent()
        return parentDirectory
    }
    
    func outputFileDirectory() throws -> URL {
        if let outputFilePath = outputFilePath {
            return outputFilePath
        }
        guard let workingDirUrl = URL(string: CLI.workingDirectory) else {
            throw AppError("Error: could not convert \(CLI.workingDirectory) to a url.")
        }
        let parentDirectory = workingDirUrl.deletingLastPathComponent()
        return parentDirectory
    }

    mutating func run() async throws {
        
        let specDir = try inputFileDirectory()
        print("Checking directory for html spec files: \(specDir)")
        let htmlStandard = try HTMLStandard.readFromFilesIn(specDir)
        print("HTML Standard DB built successfully")
        let allElements = htmlStandard.elements
        let outputDir:URL = try outputFileDirectory()
        let outElementsDir = outputDir.appending(path: "Elements")
        let fm = FileManager.default
        if (fm.fileExists(atPath: outElementsDir.path()) == false) {
            print("Creating Directory: \(outElementsDir.path())")
            try fm.createDirectory(atPath: outElementsDir.path(), withIntermediateDirectories: true)
        }
        for (eachKey, eachDef) in allElements {
            do {
                print("Starting element \(eachKey)")
                let fileBody = try Process.genElement(elementName: eachKey, eachDef, htmlStandard)
                print("\(eachKey): Body Generated Successfully")
                let upperElementName = eachKey.uppercaseFirstLetter()
                let fileName = "\(upperElementName).swift"
                let destination = outElementsDir.appending(path: fileName)
                let strOutput = destination.absoluteString
                print("Determined output: \(strOutput)")
                try fileBody.write(toFile: strOutput, atomically: true, encoding: .utf8)
                print("Successfully Written: \(fileName)")
            } catch {
                print("Unable to generate file for element \(eachKey)\n\(error.localizedDescription)")
            }
        }
        try writeEnums(to: outputDir)
        try writeMapper(to: outputDir, htmlStandard)
        try writeInterfacesFile(to: outputDir, htmlStandard)
    }
    
    static func genHeader(_ fileName:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let date = dateFormatter.string(from: Date())
        
        return """
//
//  \(fileName)
//  HTMLStandard
//
//  Generated on \(date). 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//
"""
    }

    static func genElement(elementName:String, _ element:ElementDef, _ standard:HTMLStandard) throws -> String {
        let upperElementName = elementName.uppercaseFirstLetter()
        let fileName = "\(upperElementName).swift"
        let header = genHeader(fileName)
        let attributeList = try element.attributes.map { try standard.fetchAttribute($0, elementName)}
        
        var enums = ""
        var attributes = ""
        var attributeSerialization = ""
        for possibleAttributes in attributeList {
            if (possibleAttributes.isEmpty) {
                continue
                //throw AppError("No matching attributes found for \(elementName) - Should Never Happen")
            }
            if (possibleAttributes.count == 1) {
                let attributeInfo:Attribute = possibleAttributes[0]
                let def = attributeInfo.definition
                if (def.elements.first == "HTML") {//IsGlobalAndNotSpecial
                    continue
                }
                let showTypeInfo = HtmlTypeMap.valueTypeIsDesc(def.value_type)
                
                let enumName = attributeInfo.name.uppercaseFirstLetter()
                let usesKeywords = def.value_keywords.count > 0
                
                if usesKeywords { //Creates enum
                    
                    var possibleValuesStr = ""
                    for eachPossibleValue in def.value_keywords {
                        let altMap:String?
                        if (eachPossibleValue.firstIndex(of: "-") != nil) {
                            altMap = eachPossibleValue.toCamelCase()
                        } else {
                            altMap = nil
                        }
                        if let altMap = altMap {
                            possibleValuesStr += "\n        case \(altMap) = \"\(eachPossibleValue)\""
                        } else {
                            possibleValuesStr += "\n        case \(eachPossibleValue)"
                        }
                    }
                    let enumStr = "\n" + """
    public enum \(enumName) : String, CaseIterable {
\(possibleValuesStr)

        public init?(rawValue: Substring) {
            guard
                let value = Self.allCases.first(where: { $0.rawValue == rawValue })
            else
                { return nil }
            
            self = value
        }
        
        public init(expect: Substring) throws {
            guard
                let value = Self.allCases.first(where: { $0.rawValue == expect })
            else
                { throw AppError("Unexpected value for \(enumName): \\(expect)") }
            
            self = value
        }
        
        public init(expect: String) throws {
            guard let result = \(enumName)(rawValue: expect) else {
                throw AppError("Unexpected value for \(enumName): \\(expect)")
            }
            self = result
        }
        
    }
"""
                    enums += enumStr + "\n"
                }
                
                let typeDesc = showTypeInfo ? " \(def.value_type)." : ""
                let typeMap = try HtmlTypeMap(expect: def.value_type)
                let type = usesKeywords ? enumName : typeMap.typeFrom()
                let typeDefaultValue = typeMap.defaultValue()
                
                if (attributeInfo.isGlobal()) {
                    if (usesKeywords) {
                        let attributeStr = """
                            /// \(def.desc).\(typeDesc)
                            public var \(attributeInfo.name):\(type) {
                                get { return \(type)(rawValue: globalAttributes[.\(attributeInfo.name)]) }
                                set { globalAttributes[.\(attributeInfo.name)] = newValue.rawValue }
                            }
                        """ + "\n\n"
                        attributes += attributeStr
                        
                        attributeSerialization += """
                                        case \"\(attributeInfo.name)\":
                                            \(attributeInfo.name) = try \(type)(expect: value)
                        """ + "\n"
                    } else {
                        let attributeStr = """
                        
                            /// \(def.desc).\(typeDesc)
                            public var \(attributeInfo.name):\(type) {
                                get { return globalAttributes[.\(attributeInfo.name)] }
                                set { globalAttributes[.\(attributeInfo.name)] = newValue }
                            }
                        """ + "\n\n"
                        attributes += attributeStr
                        attributeSerialization += """
                                    case \"\(attributeInfo.name)\":"
                                        \(attributeInfo.name) = \(attributeInfo.isBoolean() ? "true" : "value")
                        """ + "\n"
                    }
                } else {
                    let optional = usesKeywords ? "?" : ""
                    let attributeStr = """
                        /// \(def.desc).\(typeDesc)
                        public var \(attributeInfo.name):\(type)\(optional) = \(typeDefaultValue)
                    """ + "\n\n"
                    attributes += attributeStr
                    if (usesKeywords) {
                        attributeSerialization += """
                                        case \"\(attributeInfo.name)\":
                                            \(attributeInfo.name) = try \(type)(expect: value)
                        """ + "\n"
                    } else {
                        attributeSerialization += """
                                        case \"\(attributeInfo.name)\":
                                            \(attributeInfo.name) = \(attributeInfo.isBoolean() ? "true" : "value")
                        """ + "\n"
                    }
                }
                
                
            } else {
                var attrDesc = ""
                var typeInfo = ""
                var isFirst = true
                for eachAttr in possibleAttributes {
                    if (!isFirst) {
                        typeInfo.append(" or")
                        attrDesc.append(" or")
                    } else {
                        isFirst = false
                    }
                    let def = eachAttr.definition
                    let showTypeInfo = HtmlTypeMap.valueTypeIsDesc(def.value_type)
                    typeInfo.append(" \(def.value_type)")
                    attrDesc.append(" \(def.desc)")
                }
                let attrName = possibleAttributes.first!.name
                let attributeStr = """
                    /// \(attrDesc).\(typeInfo)
                    public var \(attrName):String? = nil
                """ + "\n\n"
                attributes += attributeStr
                attributeSerialization += """
                                case \"\(attrName)\":
                                    \(attrName) = value
                """ + "\n"
            }
        }
        
        let isVoidElement = standard.elementTypes.void_elements.contains(where: {$0 == elementName})
        let initSection:String
        
        if isVoidElement {
            initSection = "        super.init(globalAttr)"
        } else {
            initSection = """
        var allItems:[NHTMLRenderable] = []
        while let obj = try parser?.readObject(endTag: "\(elementName)", xmlToHtmlMapper) {
            allItems.append(obj)
        }
        super.init(globalAttr, allItems)
"""
        }
        
        let interfaces = element.categories.compactMap({$0.interfaceName()})
        
        let interfaceText:String
        if (interfaces.count > 0) {
            interfaceText = ", " + interfaces.joined(separator: ", ")
        } else {
            interfaceText = ""
        }
        
        
        var addChildText:String = ""
        let (childCategories, childElements) = element.buildChildrenInfo()
        
        for eachCategory in childCategories {
            guard let interfaceName = eachCategory.interfaceName() else { continue }
            let functionText = "\n\n" + """
            public func addChild(_ someElement:\(interfaceName)) {
                children.append(someElement)
            }
        """
            addChildText += functionText
        }
        
        for eachElement in childElements {
            let elementName = eachElement.uppercaseFirstLetter()
            let functionText = "\n\n" + """
            public func addChild(_ someElement:\(elementName)) {
                children.append(someElement)
            }
        """
            addChildText += functionText
        }
        
        let data = """
\(header)

/// <\(elementName)> \(element.desc)
public class \(upperElementName) : NHTMLRenderable\(interfaceText) {
\(enums)
\(attributes)
    public init() {
        super.init()
    }

    public init(_ attributes:[String:String], _ parser:XMLParser? = nil) throws {
        var globalAttr = GlobalAttributesBuilder()
        for (key, value) in attributes {
            switch (key) {
\(attributeSerialization)
                default: break
            }
            if globalAttr.trySetGlobalAttribute(key, value) {
                continue
            }
            throw AppError("Unexpected attribute: \\(key)")
        }
\(initSection)
    }
\(addChildText)
}
"""
        return data;
        
    }
}

@main
struct CLI {
    static var workingDirectory:String = ""
    static func main() async throws {
        if #available(macOS 13, *) {
            
            if (CommandLine.arguments.count == 0) {
                print("Error: Expected at least 1 command line argument (the program directory)")
                exit(EXIT_FAILURE)
            }

            workingDirectory = "/Users/isaacpaul/Downloads/test/dummy.ece"//CommandLine.arguments[0]
            
            let cmdLinArgs = CommandLine.arguments.dropFirst()
            var args:[String] = Array(cmdLinArgs)
            
            #if DEBUG
            //args.append(contentsOf: ["--help"])
            //args.append(contentsOf: ["io", "-f", "-m", "milkey/reader-lm-v2"])
            #endif
            
            await Process.main(args)
        } else {
            print("This only works on mac 13 and newer.")
            exit(EXIT_FAILURE)
        }

    }
}
