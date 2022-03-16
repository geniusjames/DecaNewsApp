//
//  SettingsCoordinator.swift
//  DecaNews
//
//  Created by Decagon on 08/03/2022.
//

import UIKit

final class SettingsCoordinator: Coordinator {

    private let navigationController: UINavigationController

    var rootViewController: UIViewController {
        navigationController
    }

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    override func start() {
        loadSettingsViewController()
    }

    func loadSettingsViewController() {
        guard let viewController = UIStoryboard(name: "Settings", bundle: nil)
                .instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController else {
                    return
                }
//        viewController.didCompleteComments = { [weak self] in
//            self?.finish()
//        }
        navigationController.pushViewController(viewController, animated: true)
    }
 }
