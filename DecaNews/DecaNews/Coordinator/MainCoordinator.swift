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
    let viewModel = ViewModel()

    init(window: UIWindow) {
        self.window = window
        controller = UINavigationController()
    }
    func start() {
        let viewController = ViewController()
        controller.pushViewController(viewController, animated: true)
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }

    func openSignUp() {
        let emailSignUpViewController = UIStoryboard(name: "EmailLogin", bundle: nil)
            .instantiateViewController(withIdentifier: "EmailLoginViewController") as? EmailLoginViewController
        emailSignUpViewController?.viewModel = viewModel
        guard let emailSignUpViewController = emailSignUpViewController else { return }
        emailSignUpViewController.coordinator = self
        controller.pushViewController(emailSignUpViewController, animated: true)
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }

    func openTopics() {
        let viewController = UIStoryboard(name: "EmailLogin", bundle: nil)
            .instantiateViewController(withIdentifier: "SelectedTopicsViewController") as? SelectedTopicsViewController
        guard let viewController = viewController else { return }
        viewController.coordinator = self
        viewController.viewModel = viewModel
        controller = UINavigationController()
        controller.pushViewController(viewController, animated: true)
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }

}
