//
//  FileManager+Ext.swift
//  gen_html
//
//  Created by Isaac Paul on 4/30/25.
//

import Foundation

extension FileManager {
    func listFiles(_ directory:URL, ext:String? = nil) throws -> [URL] {
        let fileIterator = try self.contentsOfDirectory(at: directory, includingPropertiesForKeys: [.isDirectoryKey], options: [.skipsSubdirectoryDescendants])
        let filesOnly = fileIterator.filter { (url) -> Bool in
            do {
                let resourceValues = try url.resourceValues(forKeys: [.isDirectoryKey])
                let isDirectory = resourceValues.isDirectory ?? true
                if (isDirectory) {
                    return false
                }
            } catch { return false }
            if let ext = ext {
                return url.pathExtension.lowercased() == ext
            }
            return true
        }
        return filesOnly
    }
}
