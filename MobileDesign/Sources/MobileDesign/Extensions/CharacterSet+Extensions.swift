//
//  CharacterSet+Extensions.swift
//  PlatformUI
//
//  Created by Khalid Asad on 9/21/20.
//  Copyright © 2020 Rogers Communication Inc. All rights reserved.
//

import Foundation

public extension CharacterSet {
    
    static var email: CharacterSet {
        var set = CharacterSet()
        set.formUnion(.lowercaseLetters)
        set.formUnion(.uppercaseLetters)
        set.formUnion(.decimalDigits)
        set.formUnion(.punctuationCharacters)
        set.insert(charactersIn: "!#$%&'*+-/=?^_`{|}~")
        set.insert(charactersIn: "@.")
        return set
    }
    
    static var password: CharacterSet {
        var set = CharacterSet()
        set.formUnion(.lowercaseLetters)
        set.formUnion(.uppercaseLetters)
        set.formUnion(.decimalDigits)
        set.insert(charactersIn: String.passwordSpecialCharactersAllowed)
        return set
    }
    
    static var postalCode: CharacterSet {
        var set = CharacterSet()
        set.formUnion(.uppercaseLetters)
        set.formUnion(.decimalDigits)
        return set
    }
}
