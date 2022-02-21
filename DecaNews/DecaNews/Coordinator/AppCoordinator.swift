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
    
    let servicesViewModel = ServicesViewModel()

    init(window: UIWindow) {
        self.window = window
        navigationController = UINavigationController()
    }

    override func start() {
        servicesViewModel.getOnboardedStatus ? autenticateUser() : startOnboarding()
    }

    func autenticateUser() {
        servicesViewModel.getSignedStatus ? startMainApp() : startComments()// startAuth()
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
    
    func startBookmarks() {
        let bookmarksCoordinator = BookmarksCoordinator()
        pushCoordinator(bookmarksCoordinator)
        window.rootViewController = bookmarksCoordinator.rootViewController
        window.makeKeyAndVisible()
        
        bookmarksCoordinator.didFinish = { [weak self] coordinator in
            self?.popCoordinator(coordinator)
            self?.startAuth()
        }
    }
    func startPasswordChange() {
        let changePasswordCoordinator = PasswordChangeCoordinator()
        pushCoordinator(changePasswordCoordinator)
        window.rootViewController = changePasswordCoordinator.rootViewController
        window.makeKeyAndVisible()
        
        changePasswordCoordinator.didFinish = { [weak self] coordinator in
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
