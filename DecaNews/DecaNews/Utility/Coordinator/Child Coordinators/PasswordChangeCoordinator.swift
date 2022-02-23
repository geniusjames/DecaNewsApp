//
//  PasswordChangeCoordinator.swift
//  DecaNews
//
//  Created by Geniusjames on 16/02/2022.
//

import UIKit

final class PasswordChangeCoordinator: Coordinator {
    
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
        guard let viewController = UIStoryboard(name: "EmailSignin", bundle: nil)
                .instantiateViewController(withIdentifier: "PasswordChange") as? PasswordChangeViewController else {
                    return
                }
        viewController.didCompletePasswordChange = { [weak self] in
            self?.finish()
        }
        navigationController.pushViewController(viewController, animated: true)
    }
}
