//
//  FirebaseViewModel.swift
//  DecaNews
//
//  Created by Decagon on 24/01/2022.
//

import Foundation
import Firebase

protocol AuthServiceRepository {
    func signUp(_ email: String, _ password: String, _ completionHandler: @escaping (Result<Int, Error>) -> Void)
    func signIn(_ email: String, _ password: String, completionHandler: @escaping (Result<Int, Error>) -> Void)
    func resetPassword(_ text: String, _ completionHandler: @escaping (Result<Int, Error>) -> Void)
    func changePassword(oldPassword: String, newPassword: String, _ completionHandler: @escaping (Result<Int, Error>) -> Void)
}

final class FirebaseService: AuthServiceRepository {
    
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
    func changePassword(oldPassword: String, newPassword: String, _ completionHandler: @escaping (Result<Int, Error>) -> Void) {
        guard let user = auth.currentUser else {return}
        
        guard let email = user.email else {return}
        var credential: AuthCredential
        credential = EmailAuthProvider.credential(withEmail: email, password: oldPassword )
        user.reauthenticate(with: credential) { result, error  in
            if let error = error {
                completionHandler(.failure(error))
            }
            else {
                user.updatePassword(to: newPassword) { error in
                    if let error = error {
                        completionHandler(.failure(error))
                    } else {
                        completionHandler(.success(0))
                    }
                }
            }
            
        }
        
}
}
