//
//  AuthComposer.swift
//  DecaNews
//
//  Created by Oyegoke Oluwatomisin on 18/02/2022.
//

import Foundation
import UIKit

final class AuthComposer {
    
    static func makeLoginController() -> AuthRootViewController? {
        let viewController = UIStoryboard(name: "LoginScreen", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? AuthRootViewController
        let serviceViewModel = DIContainer.makeServiceViewModel()
        serviceViewModel.addOnboarded()
        viewController?.serviceViewModel = serviceViewModel
        return viewController
    }
    
    static func makeEmailSigninController() -> EmailSiginInViewController {
        let viewController = EmailSiginInViewController.instantiate()
        viewController.servicesViewModel = DIContainer.makeServiceViewModel()
        return viewController
    }
}

class DIContainer {
    
    static func makeServiceViewModel() -> ServicesViewModel {
        let serviceViewModel = ServicesViewModel(firebaseService: makeAuthRepository())
        return serviceViewModel
    }
    
    private static func makeAuthRepository() -> AuthServiceRepository {
        let firbaseService = FirebaseService()
        return firbaseService
    }
}
