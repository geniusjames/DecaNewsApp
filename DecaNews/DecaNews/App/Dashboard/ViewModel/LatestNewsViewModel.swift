//
//  LatestNewsViewModel.swift
//  DecaNews
//
//  Created by Decagon on 01/03/2022.
//

import Foundation

final class LatestNewsViewModel {
    let url = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=c47e6bd7b3c74efa885b276cceed84e6"
    private var allArticles: [Article]?
    let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    var articles: [Article] {
        get {
            return allArticles ?? []
        }
        set {
            allArticles = newValue
        }
    }
    
    func setArticles(articles: [Article]) {
        self.articles = articles
    }
    
    func fetchData(successCompletion: @escaping () -> Void, errorCompletion: ErrorBlock) {
        networkManager.networkRequest(url: url, successCompletion: { [weak self] response in
            self?.setArticles(articles: response.articles)
            successCompletion()
        }, errorCompletion: errorCompletion)
    }
}
