//
//  EmailSigninViewModel.swift
//  DecaNews
//
//  Created by Geniusjames on 30/01/2022.
//

import Foundation

final class EmailSigninViewModel {

    func isValidEmail(email: String) -> Bool {
        if !email.contains("@") && !email.contains(".") {
            return false
        }
        return true
    }

    func isValidPassword(password: String) -> Bool {
        if password.count < 6 {
            return false
        }
        return true
    }
}
