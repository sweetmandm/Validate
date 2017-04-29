//
//  OnField.swift
//  Validate
//
//  Created by sweetman on 4/28/17.
//  Copyright © 2017 tinfish. All rights reserved.
//

import Foundation

/**
 Useful to associate an arbitrary field with the given error.
 For UI-based input fields, optionally style the field according to ValidationApparance conformance.
 */
open class OnField: ValidationError {
    open var reason: String
    open let field: Any
    
    public init(reason: String, field: Any) {
        self.reason = reason
        self.field = field
    }
    
    open func applyInvalidStyle() {
        (field as? ValidationAppearanceInvalid)?.applyInvalidStyle(error: self)
    }
    
    open func applyValidStyle() {
        (field as? ValidationAppearanceValid)?.applyValidStyle()
    }
    
    open func applyNeutralStyle() {
        (field as? ValidationAppearanceNeutral)?.applyNeutralStyle()
    }
}
