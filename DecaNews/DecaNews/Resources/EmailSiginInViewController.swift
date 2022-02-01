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
    let viewModel = EmailSigninViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configurePasswordField()
        loginButton.addTarget(self, action: #selector(login), for: .allTouchEvents)
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
        guard let emailAddress = emailTextField.text else {return}
        guard let password = passwordTextField.text else {return}
        if viewModel.isValidEmail(email: emailAddress) && viewModel.isValidPassword(password: password) {
            // perform login
        }
    }
}
