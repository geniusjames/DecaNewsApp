//
//  DashboardTableViewModel.swift
//  DecaNews
//
//  Created by Decagon on 02/03/2022.
//

import Foundation

final class DashboardTableViewModel {
    
    let articleRepository: ArticleDirectoryRepository
    let networkManagerRepository: NetworkManagerRepository
    private var allArticles: [Article]?
    
    private let url = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=c47e6bd7b3c74efa885b276cceed84e6"
    init(articleRepository: ArticleDirectoryRepository, networkManagerRepository: NetworkManagerRepository) {
        self.articleRepository = articleRepository
        self.networkManagerRepository = networkManagerRepository
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
        networkManagerRepository.networkRequest(url: url, successCompletion: { [weak self] response in
            self?.setArticles(articles: response.articles)
            successCompletion()
        }, errorCompletion: errorCompletion)
    }
    
    func addBookMark(article: Article) {
        articleRepository.addBookmark(author: article.author ?? "",
                                      title: article.title ?? "",
                                      articleDescription: article.articleDescription ?? "",
                                      url: article.url ?? "",
                                      urlToImage: article.urlToImage ?? "",
                                      publishedAt: article.publishedAt ?? "",
                                      content: article.content ?? "")
    }
    
    func deleteBookMark(url: String?) {
        guard let url = url, let bookMark = articleRepository.readBookmark(url: url) else { return }
        articleRepository.deleteBookmark(article: bookMark)
    }
}
