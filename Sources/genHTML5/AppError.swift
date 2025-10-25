//
//  AppError.swift
//  gen_html
//
//  Created by Isaac Paul on 4/30/25.
//

import Foundation

/// let someUrl:URL = try URL("hello") ?! AppError("What")
infix operator ?!: NilCoalescingPrecedence

public func ?!<T>(value: T?, error: @autoclosure () -> Error) throws -> T {
    if let value = value { return value }
    throw error()
}

struct AppError: LocalizedError {
    
    let message: String
    
    init(_ message: String) {
        self.message = message
    }
    init(_ message: String, _ error:Error) {
        self.message = "\(message) : \(error.localizedDescription)"
    }
    
    static func failure<T>(_ message: String) -> Result<T, AppError> {
        return .failure(AppError(message))
    }
    
    var errorDescription: String? {
        get {
            return message
        }
    }
    
    var localizedDescription: String {
        get {
            return message
        }
    }
}
