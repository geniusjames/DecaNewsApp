//
//  EmailSiginInViewController.swift
//  DecaNews
//
//  Created by Geniusjames on 29/01/2022.
//
import UIKit

final class EmailSiginInViewController: UIViewController {
    var showPassword: Bool = false
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    var servicesViewModel: ServicesViewModel?
    var navigateToReset: (() -> Void)?
    var navigateSignUp: (() -> Void)?
    var navigateHome: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.addTarget(self, action: #selector(login), for: .allTouchEvents)
        emailTextField.addTarget(self, action: #selector(validateInputs), for: .allEditingEvents)
        passwordTextField.addTarget(self, action: #selector(validateInputs), for: .allEditingEvents)
    }

    @objc func login() {
        guard let emailAddress = emailTextField.text
        else {return}
        guard let password = passwordTextField.text
        else {return}
        if emailAddress.isValidEmail && password.isValidPassword {
            print("seen")
            servicesViewModel?.firebaseService.signIn(emailAddress, password) {result in
                print("reached")
                
                switch result {
                case .success(_:):
                    self.navigateHome?()
                case .failure(let error):
                    UIView.animate(withDuration: 3) {
                        self.resultLabel.text = error.localizedDescription
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        self.resultLabel.text = ""
                        self.resultLabel.alpha = 1
                    }
               }
            }
        } else {
       print("here")
        }
    }

    @IBAction func forgotPassword(_ sender: Any) {
        navigateToReset?()
    }
    @IBAction func signUp(_ sender: Any) {
        navigateSignUp?()
    }

    @objc func validateInputs() {
        guard let email = emailTextField.text, let password = passwordTextField.text
        else {return}
        if !email.isEmpty {
            if !email.isValidEmail {
                emailTextField.layer.borderWidth = 1
                emailTextField.layer.borderColor = UIColor(named: "peach")?.cgColor
            }
        }
        if !password.isEmpty {
            if !password.isValidPassword {
                passwordTextField.layer.borderWidth = 1
                passwordTextField.layer.borderColor = UIColor(named: "peach")?.cgColor
            }
        }
        if email.isValidEmail || email.isEmpty {
            emailTextField.layer.borderWidth = 0
        }
        if password.isValidPassword || password.isEmpty {
            passwordTextField.layer.borderWidth = 0
        }
    }
}

extension EmailSiginInViewController: Storyboardable {
    static var storyboard: Storyboard {
        return .auth
    }
}
