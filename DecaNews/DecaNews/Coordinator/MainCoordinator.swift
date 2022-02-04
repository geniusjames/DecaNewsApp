//
//  MainCoordinator.swift
//  DecaNews
//
//  Created by Decagon on 16/01/2022.
//

import UIKit

class MainCoordinator: Coordinator {
    private var window: UIWindow
    var controller: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        controller = UINavigationController()
    }

    func start() {
        let servicesViewModel = ServicesViewModel()
        if servicesViewModel.getOnboardedStatus {
            servicesViewModel.getSignedStatus ? print("will display the home screen") : navigateToSignIn()
        } else {
            navigateToOnboarding()
        }
    }

    func navigateToOnboarding() {
        guard let viewController = UIStoryboard(name: "onboarding", bundle: nil)
                .instantiateViewController(withIdentifier: "onboarding") as? OnboardingViewController else {
                            return
                        }
        viewController.coordinator = self
        controller.pushViewController(viewController, animated: true)
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }

    func navigateToEmailSignin() {
       guard let viewController = UIStoryboard(name: "EmailSignin", bundle: nil)
                .instantiateViewController(withIdentifier: "EmailSiginInViewController") as? EmailSiginInViewController else {return}
        viewController.servicesViewModel = ServicesViewModel()
        controller.pushViewController(viewController, animated: true)
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }
    func navigateToPasswordReset() {
        guard let viewController = UIStoryboard(name: "password_reset", bundle: nil)
                .instantiateViewController(withIdentifier: "PasswordResetViewController") as? PasswordResetViewController else {return}
        viewController.resetViewModel = ResetPasswordViewModel()
        viewController.coordinator = self
         controller.pushViewController(viewController, animated: true)
         window.rootViewController = controller
         window.makeKeyAndVisible()
    }
    
    func navigateToSignUp() {
        let emailSignUpViewController = UIStoryboard(name: "EmailLogin", bundle: nil).instantiateViewController(withIdentifier: "EmailLoginViewController") as? EmailSignUpViewController
        emailSignUpViewController?.serviceViewModel = ServicesViewModel()
        guard let emailSignUpViewController = emailSignUpViewController else { return }
        emailSignUpViewController.coordinator = self
        controller.pushViewController(emailSignUpViewController, animated: true)
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }

    func navigateToSignIn() {
        let viewController = UIStoryboard(name: "LoginScreen", bundle: nil).instantiateViewController(withIdentifier: "LoginScreen") as? LoginViewController
        guard let viewController = viewController else { return }
        viewController.coordinator = self
        viewController.serviceViewModel = ServicesViewModel()
        controller = UINavigationController()
        controller.pushViewController(viewController, animated: true)
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }

    func navigateToTopics() {
        let viewController = UIStoryboard(name: "EmailLogin", bundle: nil).instantiateViewController(withIdentifier: "SelectedTopicsViewController") as? SelectedTopicsViewController
        guard let viewController = viewController else { return }
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
}
