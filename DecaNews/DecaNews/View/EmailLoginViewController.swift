//
//  EmailLoginViewController.swift
//  DecaNews
//
//  Created by Decagon on 23/01/2022.
//

import UIKit

class EmailLoginViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    var coordinator: MainCoordinator?
    var firebase: FirebaseViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    @IBAction func forgotPassword(_ sender: Any) {
//        coordinator.openResetPassword()
    }
    @IBAction func showUnshow(_ sender: Any) {
        guard let sender = sender as? UIButton else { return }
        if passwordTextField.isSecureTextEntry {
            passwordTextField.isSecureTextEntry = false
            sender.setImage(UIImage(systemName: "eye"), for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = true
            sender.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
    }
    @IBAction func createAccount(_ sender: Any) {
        if !fieldTextError(nameTextField) || !fieldTextError(emailTextField) || !fieldTextError(passwordTextField) {
            return
        }
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        firebase?.signUp(email, password, loggedIn(_:))
    }
    @IBAction func login(_ sender: Any) {
//        coordinator.openLogin()
    }

    func loggedIn(_ message: String) {
        if message == "success" {
            coordinator?.openTopics()
        } else {
            errorMessageLabel.text = message
        }
    }

    func fieldTextError(_ textField: UITextField) -> Bool {
        if textField.tag == 2 {
            if !(textField.text?.contains("@") ?? false) || !(textField.text?.contains(".") ?? false) {
                changeBorderColor(textField)
                errorMessageLabel.text = "Please enter a valid Email"
                return false
            }
        } else if textField.tag == 3 || textField.tag == 1 {
            if textField.text == "" {
                changeBorderColor(textField)
                errorMessageLabel.text = textField.tag == 3 ? "Please enter Password!" : "Please enter Name"
                return false
            }
        }
        return true
    }

    func changeBorderColor(_ textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.red.cgColor
    }

}

extension EmailLoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if !fieldTextError(textField) {
            return
        }
        textField.layer.borderWidth = 0
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        errorMessageLabel.text = ""
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(named: "peach")?.cgColor
    }
}
