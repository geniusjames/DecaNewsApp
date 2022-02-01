//
//  EmailSigninViewModel.swift
//  DecaNews
//
//  Created by Geniusjames on 30/01/2022.
//

import Foundation
import UIKit

class EmailSigninViewModel {

    func isValidEmail(email: UITextField) -> Bool {
        guard let email = email.text
        else {
            return false
        }
        if !email.contains("@") && !email.contains(".") {
            return false
        }

        return true
    }

    func isValidPassword(password: UITextField) -> Bool {
        guard let password = password.text
        else {return false}
        if password.count < 6 {
            return false
        }
        return true
    }
}
