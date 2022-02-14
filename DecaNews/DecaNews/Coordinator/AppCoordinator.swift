//
//  MainCoordinator.swift
//  DecaNews
//
//  Created by Decagon on 16/01/2022.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    private var window: UIWindow
    
    var navigationController: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        navigationController = UINavigationController()
    }
    
    override func start() {
        startOnboarding()
    }
    
    func startOnboarding() {
        let onboardingCoordinator = OnboardingCoordinator()
        pushCoordinator(onboardingCoordinator)
        window.rootViewController = onboardingCoordinator.rootViewController
        window.makeKeyAndVisible()
        
        onboardingCoordinator.didFinish = { [weak self] coordinator in
            self?.popCoordinator(coordinator)
            self?.startAuth()
        }
    }
    
    func startAuth() {
        
    }
}
