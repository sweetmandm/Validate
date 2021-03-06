//
//  OnFieldMultiple.swift
//  Validate
//
//  Created by sweetman on 4/29/17.
//  Copyright © 2017 tinfish. All rights reserved.
//

import Foundation

/**
 Useful when multiple errors may be generated by a single field.
 */
open class OnFieldMultiple: OnField {
    
    open let errors: [ValidationError]
    
    public required init(errors: [ValidationError], field: Any) {
        self.errors = errors
        let reasons = errors
            .flatMap { $0.reason.isEmpty ? nil : $0.reason }
            .joined(separator: "\n")
        super.init(reason: reasons, field: field)
    }
}
