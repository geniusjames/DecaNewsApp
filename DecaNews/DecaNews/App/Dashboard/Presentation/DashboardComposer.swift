//
//  DashboardComposer.swift
//  DecaNews
//
//  Created by Decagon on 02/03/2022.
//

import Foundation

final class DashboardComposer {
    static func makeMenuTableViewController() -> MenuTableViewController {
        let viewController = MenuTableViewController.instantiate()
        viewController.viewModel = DIContainer.makeMenuTableViewModel()
        return viewController
    }
    
    static func makeDashboardViewController() -> DashboardViewController {
        let viewController = DashboardViewController.instantiate()
        viewController.viewModel = DIContainer.makeDashboardViewModel()
        return viewController
    }
    
    static func makeLatestViewController() -> LatestNewsViewController {
        let viewController = LatestNewsViewController.instantiate()
        viewController.viewModel = DIContainer.makeLatestNewsViewModel()
        return viewController
    }
    
    static func makeDashboardCollectionViewController() -> DashboardCollectionViewController {
        let viewController = DashboardCollectionViewController.instantiate()
        viewController.viewModel = DIContainer.makeDashboardCollectionViewModel()
        return viewController
    }
    
    static func makeDashboardTableViewController() -> DashboardTableViewController {
        let viewController = DashboardTableViewController.instantiate()
        viewController.viewModel = DIContainer.makeDashboardTableViewModel()
        return viewController
    }
}
