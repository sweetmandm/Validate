//
//  FieldObject.swift
//  Validate
//
//  Created by sweetman on 4/30/17.
//  Copyright © 2017 tinfish. All rights reserved.
//

import Foundation
@testable import Validate

class FieldObject: NSObject, ValidationAppearanceValid, ValidationAppearanceInvalid, ValidationAppearanceNeutral {
    var called: [String] = []
    var withError: ValidationError?
    
    func applyValidStyle() {
        called.append(#function)
    }
    
    func applyInvalidStyle(error: ValidationError) {
        called.append(#function)
        self.withError = error
    }
    
    func applyNeutralStyle() {
        called.append(#function)
    }
}
