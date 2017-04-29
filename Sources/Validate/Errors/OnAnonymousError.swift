//
//  OnAnonymousError.swift
//  Validate
//
//  Created by sweetman on 4/28/17.
//  Copyright © 2017 tinfish. All rights reserved.
//

import Foundation

/**
 Useful to express a basic error without tracking reason or context.
 */
open class OnAnonymousError: ValidationError {
    public let reason = "Error"
}
