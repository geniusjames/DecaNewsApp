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
    var id: String?
    let db = Firestore.firestore()

    init(collectionName: String) {
        self.collectionName = collectionName
    }
    func add<T: Codable>(item: T) {
        do {
            try db.collection(collectionName).document().setData(from: item)
        } catch {
            print("error")
        }
    }
    func delete(documentID: String) {
        db.collection(collectionName).document(documentID).delete { err in
            if let err = err {
                print("Error deleting document: \(err)")
            } else {
                print("Document deleted")
            }
        }
    }
    
    func update() {

    }
    
    func search() {
        
    }
    
//    func fetch() -> [[String: Any]]{
//        var output: [[String : Any]] = []
//        let docRef = Firestore.firestore().collection(collectionName)
//        docRef.getDocuments() { (document, error) in
//            if let error = error {
//                print(error)
//            } else {
//                for doc in document!.documents {
//                    output.append(doc.data())
//                    print(doc.data(), "look here")
//                }
//            }
//    }
//        return output
//    }
    func read<T: Codable>() -> [T] {
        var output: [T] = []
        do {
            db.collection(collectionName).getDocuments { (querySnapshot, error) in
                  
                  if let error = error {
                      print(error)
                  } else {
                      for documents in querySnapshot!.documents {
                          let result = Result {
                              try? documents.data(as: T.self)
                          }
                          switch result {
                          case .success(let doc):
                              if let doc = doc {
                                  output.append(doc)
                                  print(doc)
                              } else {
                                  print("document does not exists")
                              }
                          case .failure(let error):
                              print(error)
                          }
                   }
                }
            }
        }
        return output
    }
    private func enableOffline() {
           let settings = FirestoreSettings()
           settings.isPersistenceEnabled = true
           db.settings = settings
       }
}

protocol PersistenceManager {
    func add<T: Codable>(item: T)
    func delete(documentID: String)
    func update()
    func search()
    func read<T: Codable>() -> [T]
}
