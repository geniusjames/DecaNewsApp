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
    
    private let url = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=eab5e092c34a4cbb9d8443165b75f194" //"https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=c47e6bd7b3c74efa885b276cceed84e6"
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
        let bookmark = BookmarkComposer.makeBookmarkFromArticle(article)
        articleRepository.addBookmark(bookmark)
    }

    func deleteBookMark(url: String?) {
        guard let url = url, let bookMark = articleRepository.readBookmark(url: url) else { return }
        articleRepository.deleteBookmark(article: bookMark)
    }
}
