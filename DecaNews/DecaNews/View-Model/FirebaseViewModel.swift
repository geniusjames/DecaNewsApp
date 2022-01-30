//
//  FirebaseViewModel.swift
//  DecaNews
//
//  Created by Decagon on 24/01/2022.
//

import Foundation
import Firebase

class FirebaseViewModel {
    let auth = Auth.auth()

    func signUp(_ email: String, _ password: String, _ completionHandler: @escaping (String) -> Void) {
        var response = "success"
        auth.createUser(withEmail: email, password: password) { _, error in
            if let error = error {
                // there's an error
                response = error.localizedDescription
            }
            completionHandler(response)
//            print(result?.user.service)
//            response = true
        }
    }

    func signIn(_ email: String, _ password: String) {

    }
}
