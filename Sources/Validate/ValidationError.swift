//
//  ValidationError.swift
//  Validate
//
//  Created by sweetman on 4/27/17.
//  Copyright © 2017 tinfish. All rights reserved.
//

import Foundation

public protocol ValidationError: Error {
    var reason: String { get }
}
