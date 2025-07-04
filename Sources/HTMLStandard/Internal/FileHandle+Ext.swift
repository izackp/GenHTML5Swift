//
//  FileHandle+Ext.swift
//  HTMLStandard
//
//  Created by Isaac Paul on 7/4/25.
//
import Foundation

extension FileHandle {
    /* Fun Facts
     readToEnd() vs availableData()
     
     What happens when we get 0 bytes but have length left over?
     For files:
         we allow 0 length depending on untilEOF
     For streams:
         untilEOF == true -> we keep trying until we get it or pipe is broken
         untilEOF == false -> we allow ourselves to stop if we have no more data
     
     Both pass Int.max for length
     
     THUS:
     availableData
        - Will be fine with files
        - Will hang (linux) until Int.max is reached for everything else (or pipe broken on windows)
        - Will crash on null file handle
     
     readToEnd
        - Will be fine with files
        - Will stop when streams return 0 data
     */
    func readAllData() throws -> Foundation.Data? {
        if #available(macOS 10.15.4, *) {
            return try self.readToEnd()
        } else {
            return self.readData(ofLength: Int.max)
        }
    }
}
