//
//  String+check.swift
//  Validate
//
//  Created by sweetman on 4/29/17.
//  Copyright © 2017 tinfish. All rights reserved.
//

import Foundation

extension String {
    
    func isLonger(than min: Int) -> Bool {
        return lengthOfBytes(using: .utf8) > min
    }
    
    func isShorter(than max: Int) -> Bool {
        return lengthOfBytes(using: .utf8) < max
    }
    
    var containsMixedCase: Bool {
        let onlyLetters = components(separatedBy: CharacterSet.letters.inverted).joined()
        
        let noCaps = onlyLetters
            .components(separatedBy: .uppercaseLetters)
            .joined()
            .lengthOfBytes(using: .utf8)
        
        let length = onlyLetters.lengthOfBytes(using: .utf8)
        
        return noCaps > 0 && length != noCaps
    }
    
    var isUppercase: Bool {
        return components(separatedBy: .lowercaseLetters).joined().lengthOfBytes(using: .utf8) == 0
    }
    
    var isLowercase: Bool {
        return components(separatedBy: .uppercaseLetters).joined().lengthOfBytes(using: .utf8) == 0
    }
}
