//
//  ViewModel.swift
//  DecaNews
//
//  Created by mac on 16/01/2022.
//

import Foundation

final class ServicesViewModel {
    let firebaseService: FirebaseService
    private let defaultsStorage = UserDefaults.standard
    private let topicStorage = "selectedTopics"
    private let onboardingStorage = "onboarded"
    private let signedInStorage = "signedInStatus"

    init() {
     firebaseService = FirebaseService()
    }
    
    var getTopics: [String]? {
        return find(topicStorage) as [String]?
    }

    var getOnboardedStatus: Bool {
        if find(onboardingStorage) as Bool? != nil {
            return true
        }
        return false
    }

    var getSignedStatus: Bool {
        if let signedInStatus = find(signedInStorage) as Bool? {
            return signedInStatus
        }
        return false
    }

    func add(topics: [String]) {
        add(topics, topicStorage)
    }

    func addOnboarded() {
        add(true, onboardingStorage)
    }

    func signIn() {
        add(true, signedInStorage)
    }

    func signOut() {
        add(false, signedInStorage)
    }

    func add<T: Encodable>(_ items: T, _ storage: String) {
        let encodedItems = try? JSONEncoder().encode(items)
        guard let encodedItems = encodedItems else {
            return
        }
        defaultsStorage.set(encodedItems, forKey: storage)
    }

    func find<T: Decodable>(_ key: String) -> T? {
        guard let data = defaultsStorage.object(forKey: key) as? Data else {
            return nil
        }
        let decodedItem = try? JSONDecoder().decode(T.self, from: data)
        return decodedItem
    }
}
