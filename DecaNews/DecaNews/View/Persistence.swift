//
//  Persistence.swift
//  DecaNews
//
//  Created by Geniusjames on 10/02/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
class FireStorePersistence: PersistenceManager {
    var collectionName: String
    var id: String

    init(collectionName: String, id: String) {
        self.collectionName = collectionName
        self.id = id
    }

    func add<T: Codable>(item: T) {
        do {
            try Firestore.firestore().collection(collectionName).document().setData(from: item)
        } catch {
            print("error")
        }
    }
    
    func delete() {
    
    }
    
    func update() {

    }
    
    func search() {
        
    }
    func fetch() -> [[String: Any]]{
        var output: [[String : Any]] = []
        let docRef = Firestore.firestore().collection(collectionName)
        docRef.getDocuments() { (document, error) in
            if let error = error {
                print(error)
            } else {
                for doc in document!.documents {
                    output.append(doc.data())
                    print(doc.data(), "look here")
                }
            }
    }
        return output
    }
}

protocol PersistenceManager {
    func add<T: Codable>(item: T)
    func delete()
    func update()
    func search()
    func fetch() -> [[String : Any]]

}
