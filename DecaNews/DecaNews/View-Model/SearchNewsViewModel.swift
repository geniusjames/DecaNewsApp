//
//  SearchNewsViewModel.swift
//  DecaNews
//
//  Created by Decagon on 16/02/2022.
//

import Foundation

final class SearchNewsViewModel {
    private let newsURL: String
    var articles = [Article]()
    private var currentSortPattern: SearchSortBy = .popular
    var currentSearchString = "News"
    var included = false
    
    var populateTable: (() -> Void)?
    
    init() {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY-MM-dd"
        let toDate = dateFormatter.string(from: date)
        var dayComponent = DateComponents()
        dayComponent.day = -7 // For removing one day (yesterday): -1
        let theCalendar = Calendar.current
        let nextDate = theCalendar.date(byAdding: dayComponent, to: date) ?? Date()
        let fromDate = dateFormatter.string(from: nextDate)
        newsURL =  "https://newsapi.org/v2/everything?q=\(currentSearchString)\(currentSortPattern == .popular ? "&sortBy=popularity" : "")&from=\(fromDate)&to=\(toDate)&apiKey=c47e6bd7b3c74efa885b276cceed84e6"
    }
    
    var getCurrentSortPattern: SearchSortBy {
        return currentSortPattern
    }
    var getCurrentSearchString: String {
        return currentSearchString
    }
    
    func fetchNews() {
        NetworkManagers().networkRequest(url: newsURL) { [weak self] res in
            self?.articles = res.articles
            self?.populateTable?()
        } errorCompletion: { _ in
        }

    }
    
    func setCurrentSortPattern(_ sortBy: SearchSortBy) {
        currentSortPattern = sortBy
    }
    func setCurrentSearchString(_ searchString: String) {
        currentSearchString = searchString
    }
    func dateChanger(_ isoDate: String?) -> Date {
        guard let isoDate = isoDate else {
            return Date()
        }

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from:isoDate) {
            return date
        }
        return Date()
    }
    func sort() {
        switch currentSortPattern {
        case .popular:
            fetchNews()
        case .newest:
            articles.sort { art1, art2 in
                return dateChanger(art1.publishedAt) > dateChanger(art2.publishedAt)
            }
        case .oldest:
            articles.sort { art1, art2 in
                return dateChanger(art1.publishedAt) < dateChanger(art2.publishedAt)
            }
        }
    }
}
