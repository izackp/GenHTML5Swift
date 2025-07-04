//
//  ReferrerPolicy.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

public enum ReferrerPolicy : String, CaseIterable {
    
    case no-referrer = "noReferrer"
    case no-referrer-when-downgrade = "noReferrerWhenDowngrade"
    case same-origin = "sameOrigin"
    case origin = "origin"
    case strict-origin = "strictOrigin"
    case origin-when-cross-origin = "originWhenCrossOrigin"
    case strict-origin-when-cross-origin = "strictOriginWhenCrossOrigin"
    case unsafe-url = "unsafeUrl"

    
    public init?(anyCase: String) {
        let lcValue = anyCase.lowercased()
        guard let result = ReferrerPolicy(rawValue: lcValue) else {
            return nil
        }
        self = result
    }
    
    public init(expect: String) throws {
        guard let result = ReferrerPolicy(anyCase: expect) else {
            throw AppError("Unexpected value for Referrer Policy: \(expect)")
        }
        self = result
    }
}