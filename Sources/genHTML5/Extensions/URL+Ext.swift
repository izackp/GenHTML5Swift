//
//  URL+Ext.swift
//  gen_html
//
//  Created by Isaac Paul on 4/30/25.
//

import Foundation

extension URL {
    func convertExtension(_ newExt:String) -> URL {
        let ext = self.pathExtension
        let fileName = self.lastPathComponent
        let extIndex = fileName.index(fileName.startIndex, offsetBy: fileName.count - (ext.count + 1))
        let withoutExt = fileName[fileName.startIndex..<extIndex]
        let newOut = self.deletingLastPathComponent().appendingPathComponent("\(withoutExt).\(newExt)")
        return newOut
    }
    func fileInDir(_ fileName:String) -> URL {
        let newOut = self.deletingLastPathComponent().appendingPathComponent(fileName)
        return newOut
    }
}
