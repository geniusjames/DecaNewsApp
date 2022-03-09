//
//  BookmarksViewModel.swift
//  DecaNews
//
//  Created by Geniusjames on 09/02/2022.
//

import Foundation
import Firebase

class BookmarksViewModel {
  
    var articleDirectory: ArticleDirectory?
    let cellID = "cell"
 
    func fetch (completion: @escaping ( ([BookmarkArticle]) -> Void)) {
        guard let articleDirectory = articleDirectory else {
            return
        }
        
        completion(articleDirectory.readBookmarks())
        }
    
    func removeBookmark(bookmark: BookmarkArticle) {
        guard let articleDirectory = articleDirectory else {
            return
        }
        articleDirectory.deleteBookmark(article: bookmark)
    }
}
