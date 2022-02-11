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
            store.read(model: news)
    }
    let news = News(author: "", title: "", articleDescription: "", url: "", urlToImage: "", publishedAt: "", content: "")

    func fetchPersistedNews() {
        
    }
}
