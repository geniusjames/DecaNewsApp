//
//  FirebaseViewModel.swift
//  DecaNews
//
//  Created by Decagon on 24/01/2022.
//

import Foundation
import Firebase

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

    func signIn(_ email: String, _ password: String) {

    }
}
