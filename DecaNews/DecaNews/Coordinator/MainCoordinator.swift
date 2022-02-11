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
        viewController.navigateToSignIn = { [weak self] in
            self?.navigateToSignIn()
        }
        controller.pushViewController(viewController, animated: true)
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }

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
	
	func navigateToDashboard() {
		let viewController = UIStoryboard(name: "Dashboard",
					   bundle: nil).instantiateViewController(withIdentifier: "Dashboard") as? DashboardViewController
		guard let viewController = viewController else { return }
		viewController.navigateLatestNewsScreen = { [weak self] in
			self?.navigateToLatestNewsScreen()
		}
		viewController.coordinator = self
		controller = UINavigationController()
		controller.pushViewController(viewController, animated: true)
		window.rootViewController = controller
		window.makeKeyAndVisible()
	}
	
	func navigateToLatestNewsScreen() {
		guard let viewController = UIStoryboard(name: "Dashboard",
					   bundle: nil).instantiateViewController(withIdentifier: "LatestNewsVC") as? LatestNewsViewController
		 else {return}
		viewController.coordinator = self
		controller.pushViewController(viewController, animated: true)
		window.rootViewController = controller
		window.makeKeyAndVisible()
	}
    
    func navigatingToSideMenu() {
        guard let viewController = UIStoryboard(name: "SideMenu",
                       bundle: nil).instantiateViewController(withIdentifier: "SideMenuViewController") as? SideMenuViewController
         else {return}
        viewController.coordinator = self
        controller.pushViewController(viewController, animated: true)
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }
}
