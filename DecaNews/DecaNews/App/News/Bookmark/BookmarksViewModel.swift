//
//  BookmarksViewModel.swift
//  DecaNews
//
//  Created by Geniusjames on 09/02/2022.
//

import Foundation
import Firebase

class BookmarksViewModel {
  
    var articleDirectory = ArticleDirectory()
    let cellID = "cell"
    var bookmarkArticles: [BookmarkArticle]?
    
    init() {
        bookmarkArticles = articleDirectory.readBookmarks()
    }
    func fetch (completion: @escaping ( ([BookmarkArticle]) -> Void)) {
        completion(articleDirectory.readBookmarks())
        }
    
    func removeBookmark(bookmark: BookmarkArticle) {
        articleDirectory.deleteBookmark(article: bookmark)
    }
    
    func calcReadingTime(text: String) -> String{
        return "\((text.count / 1000) * 4) mins"
    }
}
