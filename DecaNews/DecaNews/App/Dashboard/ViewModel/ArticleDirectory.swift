//
//  ArticleDirectory.swift
//  DecaNews
//
//  Created by mac on 09/02/2022.
//

import Foundation

class ArticleDirectory {
	
	static let key = "articles"
	
	func getAllBookmarks() -> [Article] {
		guard let articleData = UserDefaults.standard.object(forKey: ArticleDirectory.key) as? Data else {
			return []
		}
		let decodedPet = try? JSONDecoder().decode([Article].self, from: articleData)
		return decodedPet ?? []
	}
	
	func saveArticle(with article: Article) {
		var allArticles = getAllBookmarks()
		allArticles.append(article)
		updateArticles(with: allArticles)
	}
	
	func updateArticles(with data: [Article]) {
		let encodedArticle = try? JSONEncoder().encode(data)
		UserDefaults.standard.set(encodedArticle, forKey: ArticleDirectory.key)
	}
	
	func updateBookmarks(with article: Article) {
		let allArticles = getAllBookmarks()
		if allArticles.contains(where: { $0.title == article.title }) {
			updateArticles(with: allArticles.filter { $0.title != article.title })
		} else {
			saveArticle(with: article)
		}
	}
	
}
