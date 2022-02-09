//
//  NewsModel.swift
//  DecaNews
//
//  Created by mac on 09/02/2022.
//

import Foundation

// MARK: - Empty
struct Empty: Codable {
	let status: String
	let totalResults: Int
	let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
	let source: Source
	let author: String?
	let title, articleDescription: String
	let url: String
	let urlToImage: String
	let publishedAt: Date
	let content: String

	enum CodingKeys: String, CodingKey {
		case source, author, title
		case articleDescription = "description"
		case url, urlToImage, publishedAt, content
	}
}

// MARK: - Source
struct Source: Codable {
	let id: String?
	let name: String
}
