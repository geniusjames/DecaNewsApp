//
//  CommentsCoordinator.swift
//  DecaNews
//
//  Created by Decagon on 20/02/2022.
//

import UIKit

final class CommentsCoordinator: Coordinator {

    private let navigationController: UINavigationController

    var rootViewController: UIViewController {
        navigationController
    }

    override init() {
        navigationController = UINavigationController()
    }

    override func start() {
        loadPasswordChangeViewController()
    }

    func loadPasswordChangeViewController() {
        guard let viewController = UIStoryboard(name: "Comments", bundle: nil)
                .instantiateViewController(withIdentifier: "CommentsViewController") as? CommentsViewController else {
                    return
                }
        viewController.didCompleteComments = { [weak self] in
            self?.finish()
        }
        navigationController.pushViewController(viewController, animated: true)
    }
 }
