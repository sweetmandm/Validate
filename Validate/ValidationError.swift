//
//  ValidationError.swift
//  Validate
//
//  Created by sweetman on 4/27/17.
//  Copyright © 2017 tinfish. All rights reserved.
//

import Foundation

public protocol ValidationError { }

public protocol ValidationField: ValidationError {
    associatedtype FieldType
    var field: FieldType { get }
}

open class OnError: ValidationError { }

open class OnReason: ValidationError {
    open let reason: String
    public init(_ reason: String) {
        self.reason = reason
    }
}

open class OnField<T: UIView>: ValidationField {
    open let reason: String?
    open let field: T
    
    public init(reason: String?, field: T) {
        self.reason = reason
        self.field = field
    }
    
    open func applyStyle() {
        (field as? ValidationAppearanceInvalid)?.applyInvalidStyle(error: self)
    }
}

open class OnMultiple: ValidationError {
    let errors: [ValidationError]
    public init(_ errors: [ValidationError]) {
        self.errors = errors
    }
}
