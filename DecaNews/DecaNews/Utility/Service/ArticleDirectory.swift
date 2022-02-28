//
//  ArticleDirectory.swift
//  DecaNews
//
//  Created by mac on 09/02/2022.
//

import Foundation
import RealmSwift

class ArticleDirectory {
	
	private let realm = try? Realm()

	func readBookmarks() -> [BookmarkArticle] {
		var data = [BookmarkArticle]()
		data = realm!.objects(BookmarkArticle.self).map({ $0 })
		return data
	}

	func addBookmark(
		author: String,
		title: String,
		articleDescription: String,
		url: String,
		urlToImage: String,
		publishedAt: String,
		content: String
	) {
		let newBookmark = BookmarkArticle()
		newBookmark.author = author
		newBookmark.title = title
		newBookmark.articleDescription = articleDescription
		newBookmark.url = url
		newBookmark.urlToImage = urlToImage
		newBookmark.publishedAt = publishedAt
		newBookmark.content = content
		try? realm!.write {
			realm!.add(newBookmark)
		}
	}

	func deleteBookmark(article: BookmarkArticle) {
		try? realm!.write {
			realm!.delete(article)
		}
	}

	func updateBookmark(
		article: BookmarkArticle,
		author: String,
		title: String,
		articleDescription: String,
		url: String,
		urlToImage: String,
		publishedAt: String,
		content: String
	) {
		try? realm!.write {
			article.author = author
			article.title = title
			article.articleDescription = articleDescription
			article.url = url
			article.urlToImage = urlToImage
			article.publishedAt = publishedAt
			article.content = content
			realm!.add(article, update: .all)
		}
	}
	
}