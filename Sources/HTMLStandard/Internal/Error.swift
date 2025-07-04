//
//  Error.swift
//  gen_html
//
//  Created by Isaac Paul on 7/4/25.
//
import Foundation

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
