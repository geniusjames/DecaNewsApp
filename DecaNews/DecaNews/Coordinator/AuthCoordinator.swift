//
//  AuthCoordinator.swift
//  DecaNews
//
//  Created by Oyegoke Oluwatomisin on 14/02/2022.
//

import UIKit

final class AuthCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    
    var rootViewController: UIViewController {
        navigationController
    }
    
    override init() {
        navigationController = UINavigationController()
    }
    
    override func start() {
        loadAuthRoot()
    }
    
    func loadAuthRoot() {
        let viewController = UIStoryboard(name: "LoginScreen", bundle: nil).instantiateViewController(withIdentifier: "LoginScreen") as? LoginViewController
        guard let viewController = viewController else { return }
        let serviceViewModel = ServicesViewModel()
        serviceViewModel.addOnboarded()
        viewController.serviceViewModel = serviceViewModel
        navigationController.pushViewController(viewController, animated: true)
    }
}
