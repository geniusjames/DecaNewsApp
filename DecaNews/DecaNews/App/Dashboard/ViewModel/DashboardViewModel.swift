//
//  DashboardViewModel.swift
//  DecaNews
//
//  Created by Decagon on 01/03/2022.
//

import Foundation

class DashboardViewModel {
    
    let networkManager: NetworkManager
    let articleRepository: ArticleDirectoryRepository
    
    init(networkManager: NetworkManager, articleRepository: ArticleDirectoryRepository) {
        self.networkManager = networkManager
        self.articleRepository = articleRepository
    }
    
    var bookmarks: [BookmarkArticle] {
        articleRepository.readBookmarks()
    }
    
    func fetchData(url: String) -> [Article] {
        var articles: [Article]?
        networkManager.networkRequest(url: url) { [weak self] response in
            articles? = response.articles
        } errorCompletion: { error in
            print("THE ERROR IS: ", error)
        }
        return articles ?? []
    }
    
}
