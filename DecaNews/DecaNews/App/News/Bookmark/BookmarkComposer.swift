//
//  BookmarkComposer.swift
//  DecaNews
//
//  Created by Geniusjames on 08/03/2022.
//

import Foundation

final class BookmarkComposer {
    
    static func makeBookmarkFromArticle(_ article: Article) -> BookmarkArticle {
            let bookmark = BookmarkArticle()
            bookmark.author = article.author ?? ""
            bookmark.title = article.title ?? ""
            bookmark.urlToImage = article.urlToImage ?? ""
            bookmark.url = article.url ?? ""
            bookmark.publishedAt = article.publishedAt ?? ""
            bookmark.content = article.content ?? ""
            bookmark.articleDescription = article.articleDescription ?? ""
        return bookmark
    }
}
