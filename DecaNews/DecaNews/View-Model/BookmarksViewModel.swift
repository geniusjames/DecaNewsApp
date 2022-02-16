//
//  BookmarksViewModel.swift
//  DecaNews
//
//  Created by Geniusjames on 09/02/2022.
//

import Foundation
import Firebase

class BookmarksViewModel {
  
    let store = FireStorePersistence(collectionName: "new")
    let cellID = "cell"
    var items: [News]
    init () {
        items = store.read { contents in
            print(contents, "james")
        }
    }
    func fetchPersistedNews() {
        
    }
    func fetch( completion: @escaping (([News]) -> Void)){
        items =  store.read { contents in
            completion(contents)
        }
    }
}
