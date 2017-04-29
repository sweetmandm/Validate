//
//  OnReason.swift
//  Validate
//
//  Created by sweetman on 4/28/17.
//  Copyright © 2017 tinfish. All rights reserved.
//

import Foundation

/**
 Useful to associate a reason with the given error.
 */
open class OnReason: ValidationError {
    
    open let reason: String
    
    public init(_ reason: String) {
        self.reason = reason
    }
}
