//
//  OnMultiple.swift
//  Validate
//
//  Created by sweetman on 4/28/17.
//  Copyright © 2017 tinfish. All rights reserved.
//

import Foundation

/**
 Useful to compose multiple errors into a single error value.
 */
open class OnMultiple: ValidationError {
    
    public var reason: String {
        return errors
            .flatMap { $0.reason.isEmpty ? nil : $0.reason }
            .joined(separator: "\n")
    }
    
    open let errors: [ValidationError]
    
    public init(_ errors: [ValidationError]) {
        self.errors = errors
    }
}
