//
//  DIContainer.swift
//  DecaNews
//
//  Created by Oyegoke Oluwatomisin on 28/02/2022.
//

import Foundation

final class DIContainer {
    
    static func makeUserStore() -> UserPersistenceStore {
        return UserStore()
    }
    
    static func makeServiceViewModel() -> ServicesViewModel {
        let serviceViewModel = ServicesViewModel(firebaseService: makeAuthRepository())
        return serviceViewModel
    }
    
    private static func makeAuthRepository() -> AuthServiceRepository {
        let firbaseService = FirebaseService()
        return firbaseService
    }
    
    static func makeOnboardingViewModel() -> OnboardingViewModel {
        let userStore = makeUserStore()
        return OnboardingViewModel(store: userStore)
    }
  
    static func makeResetPasswordViewModel() -> ResetPasswordViewModel {
        let resetPasswordViewModel = ResetPasswordViewModel()
        return resetPasswordViewModel
    }
  
    static func makeSignUpViewModel() -> SignUpViewModel {
        let userStore = makeUserStore()
        let authServiceRepository = makeAuthRepository()
        return SignUpViewModel(store: userStore, auth: authServiceRepository)
    }

    static func makeEmailSignInViewModel() -> EmailSignInViewModel {
        return EmailSignInViewModel(store: makeUserStore(), authServiceRepository: makeAuthRepository())
    }
}
