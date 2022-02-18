//
//  AuthComposer.swift
//  DecaNews
//
//  Created by Oyegoke Oluwatomisin on 18/02/2022.
//

import Foundation
import UIKit

final class AuthComposer {
    
    static func makeLoginController(with email: String) -> LoginViewController? {
        let viewController = UIStoryboard(name: "LoginScreen", bundle: nil).instantiateViewController(withIdentifier: "LoginScreen") as? LoginViewController
        let serviceViewModel = DIContainer.makeServiceViewModel()
        serviceViewModel.addOnboarded()
        viewController.serviceViewModel = serviceViewModel
        return viewController
    }
    
    func makeEmailSigninController() -> EmailSiginInViewController? {
        let viewController = UIStoryboard(name: "EmailSignin", bundle: nil)
            .instantiateViewController(withIdentifier: "EmailSiginInViewController") as? EmailSiginInViewController
        viewController?.servicesViewModel = DIContainer.makeServiceViewModel()
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
