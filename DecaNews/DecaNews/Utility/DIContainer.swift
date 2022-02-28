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
}
