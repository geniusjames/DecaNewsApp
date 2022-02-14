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
        let viewController = UIStoryboard(name: "Dashboard",
                       bundle: nil).instantiateViewController(withIdentifier: "Dashboard") as? DashboardViewController
        guard let viewController = viewController else { return }
        navigationController.pushViewController(viewController, animated: true)
    }
}
