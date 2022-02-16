//
//  PasswordChangeViewController.swift
//  DecaNews
//
//  Created by Geniusjames on 16/02/2022.
//

import UIKit

class PasswordChangeViewController: UIViewController {
    @IBOutlet weak var oldPasswordTextField: HideShowPasswordTextField!
    @IBOutlet weak var newPasswordTextField: HideShowPasswordTextField!
    @IBOutlet weak var passwordConfirmationTextField: HideShowPasswordTextField!
    @IBAction func changePasswordPressed(_ sender: Any) {
    }
    var servicesViewModel: ServicesViewModel?
    var didCompletePasswordChange: CoordinatorTransition?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func updatePasswords() {
        guard let oldPassword = oldPasswordTextField.text, let newPassword = newPasswordTextField.text, let passwordConfirmation = passwordConfirmationTextField.text else {return}
        
        if oldPassword.isValidPassword && newPassword.isValidPassword && (newPassword == passwordConfirmation) {
            servicesViewModel?.firebaseService.changePassword(oldPassword: oldPassword, newPassword: newPassword) { result in
                switch result {
                case .failure(let error):
                    print(error)
                case .success(_:):
                    print("password changed")
                }
            }
        }
    }
}
