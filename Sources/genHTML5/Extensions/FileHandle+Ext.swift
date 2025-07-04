//
//  FileHandle+Ext.swift
//  gen_html
//
//  Created by Isaac Paul on 4/30/25.
//

import Foundation

extension FileHandle {
    
    /// Creates the file before init a handle
    convenience init(_ url:URL, _ overwrite:Bool, _ fm:FileManager = FileManager.default) throws {
        if (fm.fileExists(atPath: url.path)) {
            if (overwrite) {
                try self.init(forWritingTo: url)
            } else {
                throw AppError("File already exists. Specify overwrite to ignore. \(url.path)")
            }
        }
        
        guard fm.createFile(
            atPath: url.path,
            contents: nil,
            attributes: [:]
        ) else {
            throw AppError("Cannot access output file: \(url.path)")
        }
        try self.init(forWritingTo: url)
    }
}
