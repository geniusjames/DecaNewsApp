//
//  BookmarksViewModel.swift
//  DecaNews
//
//  Created by Geniusjames on 09/02/2022.
//

import Foundation
import Firebase

class BookmarksViewModel {
    
    let store = FireStorePersistence(collectionName: "news")
    let cellID = "cell"
    var items: [News] {
        store.read()
    }
    func fetchPersistedNews() {
        
    }
    func fetch() -> [News] {
        return store.read()
    }
}
