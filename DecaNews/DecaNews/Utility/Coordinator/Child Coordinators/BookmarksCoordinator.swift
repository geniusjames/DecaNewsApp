//
//  BookmarksCoordinator.swift
//  DecaNews
//
//  Created by Geniusjames on 15/02/2022.
//

import UIKit

final class BookmarksCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    override func start() {
        loadBookmarks()
    }

    func loadBookmarks() {
        let viewController = BookmarksViewController.instantiate()
        viewController.viewModel = DIContainer.makeBookmarkViewModel()
        
        viewController.didCompleteBookmark = { [weak self] in
            self?.finish()
        }
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
