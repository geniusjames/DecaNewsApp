//
//  EmailSiginInViewController.swift
//  DecaNews
//
//  Created by Geniusjames on 29/01/2022.
//
import UIKit

final class EmailSiginInViewController: UIViewController {
    var coordinator: MainCoordinator?
    var showPassword: Bool = false
    let button = UIButton()
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    let viewModel = EmailSigninViewModel()
    let firebaseViewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configurePasswordField()
        loginButton.addTarget(self, action: #selector(login), for: .allTouchEvents)
        emailTextField.addTarget(self, action: #selector(validateInputs), for: .allEditingEvents)
        passwordTextField.addTarget(self, action: #selector(validateInputs), for: .allEditingEvents)
    }
    func configurePasswordField() {
        let eyeView = UIView()
        eyeView.translatesAutoresizingMaskIntoConstraints = false
        eyeView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        eyeView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
        passwordTextField.rightView = eyeView
        eyeView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: eyeView.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: eyeView.centerYAnchor).isActive = true
        button.setImage(UIImage(imageLiteralResourceName: "eye-slash"), for: .normal)
        button.addTarget(self, action: #selector(showOrHidePassword), for: .touchUpInside)
        passwordTextField.rightViewMode = .always
    }

    @objc func showOrHidePassword() {
        showPassword ? { button.setImage(UIImage(imageLiteralResourceName: "eye"), for: .normal)
            passwordTextField.isSecureTextEntry = false
            showPassword = false
        }() : {button.setImage(UIImage(imageLiteralResourceName: "eye-slash"), for: .normal)
            passwordTextField.isSecureTextEntry = true
            showPassword = true
        }()
    }
    @objc func login() {
        guard let emailAddress = emailTextField.text
        else {return}
        guard let password = passwordTextField.text
        else {return}
        if emailAddress.isValidEmail && password.isValidPassword {
            firebaseViewModel.firebaseService.signIn(emailAddress, password) {result in
                switch result {
                case .success(_):
                    print("")
                    // navigate somewhere
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
    }
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
