//
//  BookmarksViewModel.swift
//  DecaNews
//
//  Created by Geniusjames on 09/02/2022.
//

import Foundation
import Firebase

class BookmarksViewModel {
    
    
    let cellID = "cell"
    var item: [BookmarkModel]?
    func fetchPersistedNews() {
        FirebaseApp.configure()
        

    }
    
}
