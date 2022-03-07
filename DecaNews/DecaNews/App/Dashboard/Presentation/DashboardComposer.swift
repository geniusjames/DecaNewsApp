//
//  DashboardComposer.swift
//  DecaNews
//
//  Created by Decagon on 02/03/2022.
//

import Foundation

final class DashboardComposer {
    
    static func makeDashboardViewController() -> DashboardViewController {
        let viewController = DashboardViewController.instantiate()
        viewController.dashboardCollectionViewController = makeDashboardCollectionViewController()
        viewController.dashboardTableViewController = makeDashboardTableViewController()
        viewController.sideMenuController = makeMenuTableViewController()
        viewController.viewModel = DIContainer.makeDashboardViewModel()
        return viewController
    }
    
    private static func makeDashboardCollectionViewController() -> DashboardCollectionViewController {
        let viewController = DashboardCollectionViewController.instantiate()
        viewController.viewModel = DIContainer.makeDashboardCollectionViewModel()
        return viewController
    }
    
    private static func makeMenuTableViewController() -> SideMenuViewController {
        let viewController = SideMenuViewController()
        viewController.viewModel = DIContainer.makeMenuTableViewModel()
        return viewController
    }
    
    private static func makeDashboardTableViewController() -> DashboardTableViewController {
        let viewController = DashboardTableViewController.instantiate()
        viewController.viewModel = DIContainer.makeDashboardTableViewModel()
        return viewController
    }
    
    static func makeLatestViewController() -> LatestNewsViewController {
        let viewController = LatestNewsViewController.instantiate()
        viewController.viewModel = DIContainer.makeLatestNewsViewModel()
        return viewController
    }
}
