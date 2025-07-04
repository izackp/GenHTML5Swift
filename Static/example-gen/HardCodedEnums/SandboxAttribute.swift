//
//  SandboxAttribute.swift
//  HTMLStandard
//
//  Generated on 07/04/2025. 
//  THIS FILE IS GENERATED. DO NOT EDIT.
//

public enum SandboxAttribute : String, CaseIterable {
    
    case allow-downloads = "allowDownloads"
    case allow-forms = "allowForms"
    case allow-modals = "allowModals"
    case allow-orientation-lock = "allowOrientationLock"
    case allow-pointer-lock = "allowPointerLock"
    case allow-popups = "allowPopups"
    case allow-popups-to-escape-sandbox = "allowPopupsToEscapeSandbox"
    case allow-presentation = "allowPresentation"
    case allow-same-origin = "allowSameOrigin"
    case allow-scripts = "allowScripts"
    case allow-top-navigation = "allowTopNavigation"
    case allow-top-navigation-by-user-activation = "allowTopNavigationByUserActivation"
    case allow-top-navigation-to-custom-protocols = "allowTopNavigationToCustomProtocols"

    
    public init?(anyCase: String) {
        let lcValue = anyCase.lowercased()
        guard let result = SandboxAttribute(rawValue: lcValue) else {
            return nil
        }
        self = result
    }
    
    public init(expect: String) throws {
        guard let result = SandboxAttribute(anyCase: expect) else {
            throw AppError("Unexpected value for Sandbox Attribute: \(expect)")
        }
        self = result
    }
}