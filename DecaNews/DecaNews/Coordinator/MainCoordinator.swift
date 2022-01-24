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
        
//        let viewController = ViewController()
       guard let viewController = UIStoryboard(name: "onboarding", bundle: nil).instantiateViewController(withIdentifier: "onboarding") as? OnboardingViewController
        else {
            return
        }
        viewController.coordinator = self
        controller.pushViewController(viewController, animated: true)
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }

}
