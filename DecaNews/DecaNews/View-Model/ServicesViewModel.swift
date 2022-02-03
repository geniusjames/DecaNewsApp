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
    private let storageName = "selectedTopics"

    init() {
     firebaseService = FirebaseService()
    }
    
    var getTopics: [String] {
        guard let topicsData = defaultsStorage.object(forKey: storageName) as? Data else {
            return []
        }
        let decodedTopics = try? JSONDecoder().decode([String].self, from: topicsData)
        return decodedTopics ?? []
    }

    func add(topics: [String]) {
        let encodedTopics = try? JSONEncoder().encode(topics)
        guard let encodedTopics = encodedTopics else {
            return
        }
        defaultsStorage.set(encodedTopics, forKey: storageName)
    }
}
