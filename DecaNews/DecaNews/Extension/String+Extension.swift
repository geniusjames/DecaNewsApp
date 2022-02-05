//
//  UITextField+Extension.swift
//  DecaNews
//
//  Created by Decagon on 30/01/2022.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        return self.contains("@") && self.contains(".")
    }
    var isValidPassword: Bool {
        let passRegEx = "(?=[^a-z]*[a-z])[^0-9]*[0-9].*"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passRegEx)
            return passwordTest.evaluate(with: self)
    }
}
