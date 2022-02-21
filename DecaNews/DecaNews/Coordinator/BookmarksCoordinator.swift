//
//  BookmarksCoordinator.swift
//  DecaNews
//
//  Created by Geniusjames on 15/02/2022.
//

import UIKit

final class BookmarksCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    var rootViewController: UIViewController {
        navigationController
    }

    override init() {
        navigationController = UINavigationController()
    }

    override func start() {
        loadBookmarks()
    }

    func loadBookmarks() {
        guard let viewController = UIStoryboard(name: "Bookmarks", bundle: nil)
                .instantiateViewController(withIdentifier: "Bookmarks") as? BookmarksViewController else {
                    return
                }

        viewController.didCompleteBookmark = { [weak self] in
            self?.finish()
        }
        navigationController.pushViewController(viewController, animated: true)
    }
}
