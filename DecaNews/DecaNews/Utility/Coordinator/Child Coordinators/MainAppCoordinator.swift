//
//  MainAppCoordinator.swift
//  DecaNews
//
//  Created by Oyegoke Oluwatomisin on 14/02/2022.
//

import UIKit

final class MainAppCoordinator: Coordinator {
    
    private let navigationController: BaseNavigationController
    
    var rootViewController: UIViewController {
        navigationController
    }
    
    override init() {
        navigationController = BaseNavigationController()
        super.init()
        navigationController.delegate = self
    }
    
    override func start() {
        loadMainAppRoot()
    }
    
    override func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        navigationController.setBlackButton()
        
    }
    
    func loadMainAppRoot() {
//        let viewController = DashboardComposer.makeDashboardViewController()
        let viewController = DashboardComposer.makeDashboarReViewController()
        viewController.didSelectArticle = { [weak self] selectedArticle in
            self?.showNewsDetail(article: selectedArticle)
        }
        
        viewController.sideMenuController.didSelectMenuOption = {
            switch $0 {
            case .home:
                self.showHome()
            case .writeNews:
                self.showWriteNews()
            case .savedNews:
                self.showBookMarks()
            case .membership:
                self.showComingSoon()
            case .help:
                self.showComingSoon()
            case .settings:
                self.showSettings()
            case .logout:
                self.logout()
//            case .version:
//                self.showVersion()
            }
        }
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showNewsDetail(article: Article) {
        let newsDetailsController = NewsDetailsViewController.instantiate()
        newsDetailsController.article = article
        navigationController.pushViewController(newsDetailsController, animated: true)
    }
    
    func showHome() {
//        let mainCoordinator = MainAppCoordinator()
//        pushCoordinator(mainCoordinator)
//
//        mainCoordinator.didFinish = { [weak self] coordinator in
//            self?.popCoordinator(coordinator)
//        }
        loadMainAppRoot()
    }
    
    func showWriteNews() {
        let writeNewsCoordinator = WriteNewsCoordinator(navigationController: navigationController)
        pushCoordinator(writeNewsCoordinator)
        
        writeNewsCoordinator.didFinish = { [weak self] coordinator in
            self?.popCoordinator(coordinator)
        }
    }
    
    func showBookMarks() {
        let bookmarksCoordinator = BookmarksCoordinator(navigationController: navigationController)
        pushCoordinator(bookmarksCoordinator)
        
        bookmarksCoordinator.didFinish = { [weak self] coordinator in
            self?.popCoordinator(coordinator)
        }
    }
    
    func showMembership() {
        
    }
    
    func showHelp() {
        
    }
    
    func showComingSoon() {
        let soonCoordinator = SoonCoordinator(navigationController: navigationController)
        pushCoordinator(soonCoordinator)
        
        soonCoordinator.didFinish = { [weak self] coordinator in
            self?.popCoordinator(coordinator)
        }
    }
    
    func showSettings() {
        let settingsCoordinator = SettingsCoordinator(navigationController: navigationController)
        pushCoordinator(settingsCoordinator)
        
        settingsCoordinator.didFinish = { [weak self] coordinator in
            self?.popCoordinator(coordinator)
        }
        
    }
    
    func logout() {
        finish()
    }
    
    func showVersion() {
        
    }
}

/*
 
 func navigateToLatestNewsScreen() {
     guard let viewController = UIStoryboard(name: "Dashboard",
                    bundle: nil).instantiateViewController(withIdentifier: "LatestNewsVC") as? LatestNewsViewController
      else {return}
     viewController.coordinator = self
     controller.pushViewController(viewController, animated: true)
     window.rootViewController = controller
     window.makeKeyAndVisible()
 }
 
 func navigateToDetailsPage() {
     guard let detailsViewController = UIStoryboard(name: "NewsDetails",
                    bundle: nil).instantiateViewController(withIdentifier: "NewsDetails") as? DetailsViewController
      else {return}
     detailsViewController.coordinator = self
     controller.pushViewController(detailsViewController, animated: true)
 }
 
 func navigatingToSideMenu() {
     guard let viewController = UIStoryboard(name: "SideMenu",
                    bundle: nil).instantiateViewController(withIdentifier: "SideMenuViewController") as? SideMenuViewController
      else {return}
     viewController.coordinator = self
     controller.pushViewController(viewController, animated: true)
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
 
 */
