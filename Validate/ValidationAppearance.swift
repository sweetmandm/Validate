//
//  ValidationAppearance.swift
//  Validate
//
//  Created by sweetman on 4/28/17.
//  Copyright © 2017 tinfish. All rights reserved.
//

import Foundation

public protocol ValidationAppearanceValid: class {
    func applyValidStyle()
}

public protocol ValidationAppearanceNeutral: class {
    func applyNeutralStyle()
}

public protocol ValidationAppearanceInvalid: class {
    func applyInvalidStyle(error: ValidationError)
}
