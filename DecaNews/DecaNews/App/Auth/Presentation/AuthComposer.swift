//
//  AuthComposer.swift
//  DecaNews
//
//  Created by Oyegoke Oluwatomisin on 18/02/2022.
//

import Foundation
import UIKit

final class AuthComposer {
    
    static func makeLoginController() -> AuthRootViewController? {
        let viewController = UIStoryboard(name: "LoginScreen", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? AuthRootViewController
        let serviceViewModel = DIContainer.makeServiceViewModel()
        serviceViewModel.addOnboarded()
        viewController?.serviceViewModel = serviceViewModel
        return viewController
    }
    
    static func makeEmailSigninController() -> EmailSiginInViewController {
        let viewController = EmailSiginInViewController.instantiate()
        viewController.servicesViewModel = DIContainer.makeServiceViewModel()
        return viewController
    }
    
    static func makeEmailSignupController() -> EmailSignUpViewController {
        let viewController = EmailSignUpViewController.instantiate()
        viewController.viewModel = DIContainer.makeSignUpViewModel()
        return viewController
    }}
