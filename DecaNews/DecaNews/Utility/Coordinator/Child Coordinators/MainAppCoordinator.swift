//
//  MainAppCoordinator.swift
//  DecaNews
//
//  Created by Oyegoke Oluwatomisin on 14/02/2022.
//

import UIKit

final class MainAppCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    var rootViewController: UIViewController {
        navigationController
    }
    
    override init() {
        navigationController = UINavigationController()
    }
    
    override func start() {
        loadMainAppRoot()
    }
    
    func loadMainAppRoot() {
        let viewController = DashboardComposer.makeDashboardViewController()
        viewController.didSelectArticle = { [weak self] selectedArticle in
            self?.showNewsDetail(article: selectedArticle)
        }
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showNewsDetail(article: Article) {
        let newsDetailsController = NewsDetailsViewController.instantiate()
        newsDetailsController.article = article
        navigationController.pushViewController(newsDetailsController, animated: true)
    }
}

/*
 
 func showWriteNews() {
     let writeNewsCoordinator = WriteNewsCoordinator(navigationController: navigationController)
     pushCoordinator(writeNewsCoordinator)
     
     writeNewsCoordinator.didFinish = { [weak self] coordinator in
         self?.popCoordinator(coordinator)
     }
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
