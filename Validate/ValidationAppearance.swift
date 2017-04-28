//
//  ValidationAppearance.swift
//  Validate
//
//  Created by sweetman on 4/28/17.
//  Copyright © 2017 tinfish. All rights reserved.
//

import Foundation

protocol ValidationAppearance: ValidationAppearanceValid, ValidationAppearanceInvalid { }

protocol ValidationAppearanceValid {
    func applyValidStyle()
}

protocol ValidationAppearanceInvalid {
    func applyInvalidStyle(error: ValidationError)
}
