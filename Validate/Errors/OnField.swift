//
//  OnField.swift
//  Validate
//
//  Created by sweetman on 4/28/17.
//  Copyright © 2017 tinfish. All rights reserved.
//

import Foundation

open class OnField: ValidationError {
    open let reason: String
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
