//
//  FirebaseViewModel.swift
//  DecaNews
//
//  Created by Decagon on 24/01/2022.
//

import Foundation
import Firebase
import SwiftUI

final class FirebaseService {
    private let auth = Auth.auth()

    func signUp(_ email: String, _ password: String, _ completionHandler: @escaping (Result<Int, Error>) -> Void) {
        auth.createUser(withEmail: email, password: password) { _, error in
            if let error = error {
                completionHandler(.failure(error))
                return
            }
            completionHandler(.success(0))
        }
    }

    func signIn(_ email: String, _ password: String, completionHandler: @escaping (Result<Int, Error>) -> Void) {
        auth.signIn(withEmail: email, password: password) { _, error in
            if let error = error {
                completionHandler(.failure(error))
                return
            }
            completionHandler(.success(0))
        }
    }

    func resetPassword(_ text: String, _ completionHandler: @escaping (Result<Int, Error>) -> Void) {
        auth.sendPasswordReset(withEmail: text) { error in
            if let error = error {
                completionHandler(.failure(error))
                return
            } else {
            completionHandler(.success(0))
            }
        }
    }
	
	func getUserDetails() -> FirebaseAuth.User? {
		let user = auth.currentUser
		return user
	}
}
