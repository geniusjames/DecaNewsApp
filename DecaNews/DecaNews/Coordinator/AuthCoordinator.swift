//
//  AuthCoordinator.swift
//  DecaNews
//
//  Created by Oyegoke Oluwatomisin on 14/02/2022.
//

import UIKit

final class AuthCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    var rootViewController: UIViewController {
        navigationController
    }
    
    override init() {
        navigationController = UINavigationController()
    }
    
    override func start() {
        // loadAuthRoot()
        navigateToEmailSignin()
    }
    
    func loadAuthRoot() {
        guard let viewController = AuthComposer.makeLoginController() else { return }
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func navigateToEmailSignin() {
        let viewController = AuthComposer.makeEmailSigninController()
        navigationController.pushViewController(viewController, animated: true)
    }
}


/*
 func navigateToEmailSignin() {
 guard let viewController = UIStoryboard(name: "EmailSignin", bundle: nil)
 .instantiateViewController(withIdentifier: "EmailSiginInViewController") as? EmailSiginInViewController else {return}
 viewController.coordinator = self
 viewController.navigateSignUp = { [weak self] in
 self?.navigateToSignUp()
 }
 viewController.navigateToReset = { [weak self] in
 self?.navigateToPasswordReset()
 }
 viewController.navigateHome = { [weak self] in
 self?.navigateToDashboard()
 }
 viewController.servicesViewModel = ServicesViewModel()
 controller.pushViewController(viewController, animated: true)
 window.rootViewController = controller
 window.makeKeyAndVisible()
 }
 func navigateToPasswordReset() {
 guard let viewController = UIStoryboard(name: "password_reset", bundle: nil)
 .instantiateViewController(withIdentifier: "PasswordResetViewController") as? PasswordResetViewController else {return}
 viewController.resetViewModel = ResetPasswordViewModel()
 viewController.navigatingToResetPasswordSent = { [weak self] in
 self?.navigatingToResetPasswordSent()
 }
 viewController.coordinator = self
 controller.pushViewController(viewController, animated: true)
 window.rootViewController = controller
 window.makeKeyAndVisible()
 }
 
 func navigateToSignUp() {
 let emailSignUpViewController = UIStoryboard(name: "EmailLogin", bundle: nil).instantiateViewController(withIdentifier: "EmailLoginViewController") as? EmailSignUpViewController
 guard let emailSignUpViewController = emailSignUpViewController else { return }
 emailSignUpViewController.coordinator = self
 emailSignUpViewController.navigateToEmailSignin = { [weak self] in
 self?.navigateToEmailSignin()
 }
 emailSignUpViewController.navigateToTopics = { [weak self] in
 self?.navigateToTopics()
 }
 emailSignUpViewController.serviceViewModel = ServicesViewModel()
 controller.pushViewController(emailSignUpViewController, animated: true)
 window.rootViewController = controller
 window.makeKeyAndVisible()
 }
 
 func navigateToSignIn() {
 let viewController = UIStoryboard(name: "LoginScreen", bundle: nil).instantiateViewController(withIdentifier: "LoginScreen") as? LoginViewController
 guard let viewController = viewController else { return }
 let serviceViewModel = ServicesViewModel()
 serviceViewModel.addOnboarded()
 viewController.coordinator = self
 viewController.navigateToEmailSignin = { [weak self] in
 self?.navigateToSignUp()
 }
 viewController.serviceViewModel = serviceViewModel
 controller = UINavigationController()
 controller.pushViewController(viewController, animated: true)
 window.rootViewController = controller
 window.makeKeyAndVisible()
 }
 
 func navigateToTopics() {
 let viewController = UIStoryboard(name: "EmailLogin", bundle: nil).instantiateViewController(withIdentifier: "SelectedTopicsViewController") as? SelectedTopicsViewController
 guard let viewController = viewController else { return }
 viewController.navigateHome = { [weak self] in
 self?.navigateToDashboard()
 }
 viewController.coordinator = self
 viewController.serviceViewModel = ServicesViewModel()
 controller = UINavigationController()
 controller.pushViewController(viewController, animated: true)
 window.rootViewController = controller
 window.makeKeyAndVisible()
 }
 
 func navigatingToResetPasswordSent() {
 guard let viewController = UIStoryboard(name: "password_reset",
 bundle: nil).instantiateViewController(withIdentifier: "ResetLinkViewController") as? ResetLinkViewController
 else {return}
 viewController.coordinator = self
 controller.pushViewController(viewController, animated: true)
 window.rootViewController = controller
 window.makeKeyAndVisible()
 }
 */
