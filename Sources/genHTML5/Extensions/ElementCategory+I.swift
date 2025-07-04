//
//  ElementCategory+I.swift
//  gen_html
//
//  Created by Isaac Paul on 7/3/25.
//

import HTMLStandard

public extension ElementCategory {
    func interfaceName() -> String? {
        switch (self) {
            case .flow:
                return "IFlow"
            case .form_associated:
                return "IFormAssociated"
            case .interactive:
                return "IInteractive"
            case .labelable:
                return "ILabelable"
            case .listed:
                return "IListed"
            case .palpable:
                return "IPalpable"
            case .phrasing:
                return "IPhrasing"
            case .submittable:
                return "ISubmittable"
            case .embedded:
                return "IEmbedded"
            case .transparent:
                return nil
            case .none:
                return nil
            case .sectioning_root:
                return "ISectioningRoot"
            case .heading:
                return "IHeading"
            case .resettable:
                return "IResettable"
            case .metadata:
                return "IMetaData"
            case .script_supporting:
                return "IScriptSupporting"
            case .sectioning:
                return "ISectioning"
        }
    }
}
