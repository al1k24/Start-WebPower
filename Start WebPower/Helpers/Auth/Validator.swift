//
//  Validator.swift
//  Start WebPower
//
//  Created by Алик on 1/8/20.
//  Copyright © 2020 ALIK MOLDOVANU. All rights reserved.
//

import Foundation

class Validator {
    
    static func isRegistrationFormFilled(login: String, email: String, password: String) -> Bool {
        guard !(login.isEmpty), !(email.isEmpty), !(password.isEmpty) else {
            return false
        }
        return true
    }
    
    static func isAuthFormFilled(login: String, password: String) -> Bool {
        guard !(login.isEmpty), !(password.isEmpty) else {
            return false
        }
        return true
    }
    
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "^.+@.+\\..{2,}$"
        return check(text: email, regEx: emailRegEx)
    }
    
    private static func check(text: String, regEx: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
        return predicate.evaluate(with: text)
    }
}
