//
//  NetworkViewModel.swift
//  DecaNews
//
//  Created by mac on 09/02/2022.
//

import Foundation

class NetworkViewModel {
	
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
