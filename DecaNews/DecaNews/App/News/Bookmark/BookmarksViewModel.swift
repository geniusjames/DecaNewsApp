//
//  BookmarksViewModel.swift
//  DecaNews
//
//  Created by Geniusjames on 09/02/2022.
//

import Foundation
import Firebase

class BookmarksViewModel {
  
    var articleDirectory: ArticleDirectory
    let cellID = "cell"
    var bookmarkArticles: [BookmarkArticle]
    
    init(articleDirectory: ArticleDirectory) {
        self.articleDirectory = articleDirectory
        bookmarkArticles = articleDirectory.readBookmarks()
    }

    func removeBookmark(bookmark: BookmarkArticle) {
        articleDirectory.deleteBookmark(article: bookmark)
    }
    
    func calcReadingTime(text: String) -> String{
        return "\((text.count / 100) * 4) mins read"
    }

}
