//
//  MainCoordinator.swift
//  DecaNews
//
//  Created by Decagon on 16/01/2022.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    private let window: UIWindow
    private let servicesViewModel: ServicesViewModel
    private var navigationController: UINavigationController
    
    init(window: UIWindow, servicesViewModel: ServicesViewModel) {
        self.window = window
        self.servicesViewModel = servicesViewModel
        navigationController = UINavigationController()
    }
    
    override func start() {
        servicesViewModel.getOnboardedStatus ? autenticateUser() : startOnboarding()
    }
    
    func startOnboarding() {
        let onboardingCoordinator = OnboardingCoordinator()
        pushCoordinator(onboardingCoordinator)
        window.rootViewController = onboardingCoordinator.rootViewController
        window.makeKeyAndVisible()
        
        onboardingCoordinator.didFinish = { [weak self] coordinator in
            self?.popCoordinator(coordinator)
            self?.autenticateUser()
        }
    }
    
    private func autenticateUser() {
        servicesViewModel.getSignedStatus ? startMainApp() : startComments()
    }
    
    func startAuth() {
        let authCoordinator = AuthCoordinator()
        pushCoordinator(authCoordinator)
        window.rootViewController = authCoordinator.rootViewController
        window.makeKeyAndVisible()
        
        authCoordinator.didFinish = { [weak self] coordinator in
            self?.popCoordinator(coordinator)
            self?.startMainApp()
        }
    }
    
    func startMainApp() {
        let mainAppCoordinator = MainAppCoordinator()
        pushCoordinator(mainAppCoordinator)
        window.rootViewController = mainAppCoordinator.rootViewController
        window.makeKeyAndVisible()
        
        mainAppCoordinator.didFinish = { [weak self] coordinator in
            self?.popCoordinator(coordinator)
            self?.startAuth()
        }
    }
    func startComments() {
        let commentsCoordinator = CommentsCoordinator()
        pushCoordinator(commentsCoordinator)
        window.rootViewController = commentsCoordinator.rootViewController
        window.makeKeyAndVisible()
        
        commentsCoordinator.didFinish = { [weak self] coordinator in
            self?.popCoordinator(coordinator)
            self?.startAuth()
        }
    }
}
}
