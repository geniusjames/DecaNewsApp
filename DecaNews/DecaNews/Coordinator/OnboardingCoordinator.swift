//
//  OnboardingCoordinator.swift
//  DecaNews
//
//  Created by Oyegoke Oluwatomisin on 14/02/2022.
//

import UIKit

final class OnboardingCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    var rootViewController: UIViewController {
        navigationController
    }
    
    override init() {
        navigationController = UINavigationController()
    }
    
    override func start() {
        loadOnboardingRoot()
    }
    
    func loadOnboardingRoot() {
        guard let viewController = UIStoryboard(name: "onboarding", bundle: nil)
                .instantiateViewController(withIdentifier: "onboarding") as? OnboardingViewController else {
                    return
                }
        navigationController.pushViewController(viewController, animated: true)
    }
}
