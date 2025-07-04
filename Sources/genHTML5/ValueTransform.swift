//
//  ValueTransform.swift
//  gen_html
//
//  Created by Isaac Paul on 7/4/25.
//

struct ValueTransform {
    internal init(name: String, swiftName: String, help: String? = nil) {
        self.name = name
        self.swiftName = swiftName
        self.help = help
    }
    
    internal init(name: String, help: String? = nil) {
        self.name = name
        self.swiftName = name
        self.help = help
    }
    
    let name: String
    let swiftName: String
    let help: String?
}
