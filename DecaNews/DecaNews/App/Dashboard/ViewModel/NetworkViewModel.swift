//
//  NetworkViewModel.swift
//  DecaNews
//
//  Created by mac on 09/02/2022.
//

import Foundation

class NetworkViewModel {
//	
//	let dashboardCollectionView = DashboardCollectionViewController()
//	let dashboardTableView = DashboardTableViewController()
	
	var popularArticles: [Article]?
	var trendingArticles: [Article]?
	var recentArticles: [Article]?
	var articles: [Article]?
	
	func networkCall(_ url: [String]) {
		for index in 0..<url.count {
			NetworkManager.shared.networkRequest(url: url[index]) { [weak self] response in
				if index == 0 {
						self?.popularArticles? = response.articles
				} else if index == 1 {
						self?.trendingArticles? = response.articles
				} else if index == 2 {
						self?.recentArticles? = response.articles
				} else {
						self?.articles? = response.articles
				}
//				self?.articles = response.articles
			} errorCompletion: { error in
				print("THE ERROR IS: ", error)
			}
		}
	}
	
	func fetchData(url: String) -> [Article] {
		var articles: [Article]?
		NetworkManager.shared.networkRequest(url: url) { [weak self] response in
			articles? = response.articles
		} errorCompletion: { error in
			print("THE ERROR IS: ", error)
		}
		return articles ?? []
	}
	
}
