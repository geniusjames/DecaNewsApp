//
//  DashboardTableViewController.swift
//  DecaNews
//
//  Created by mac on 08/02/2022.
//

import UIKit

class DashboardTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	@IBOutlet weak var tableView: UITableView!

	let directory = ArticleDirectory()
	var articles: [Article]? = [Article]()
	
	private let url = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=c47e6bd7b3c74efa885b276cceed84e6"
	
	override func viewDidLoad() {
        super.viewDidLoad()
		config()
    }
	
	private func config() {
		fetchData(url: url)
		tableView.delegate = self
		tableView.dataSource = self
	}
	
	private func fetchData(url: String) {
		NetworkManager.shared.networkRequest(url: url) { [weak self] response in
			self?.articles = response.articles
			DispatchQueue.main.async {
				self?.tableView.reloadData()
			}
		} errorCompletion: { error in
			print("THE ERROR IS: ", error)
		}
	}
	
	func updateBookmarks(with article: Article) {
		directory.addBookmark(
			author: article.author ?? "",
			title: article.title ?? "",
			articleDescription: article.articleDescription ?? "",
			url: article.url ?? "",
			urlToImage: article.urlToImage ?? "",
			publishedAt: article.publishedAt ?? "",
			content: article.content ?? ""
		)
	}
	
	func deleteBookmark(with article: Article) {
		print("delete Bookmark")
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		articles?.count ?? 10
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardTableViewCell", for: indexPath) as? DashboardTableViewCell
		else { return UITableViewCell() }
		
		if let articles = articles {
			let article = articles[indexPath.row]
			cell.setup(with: article)
			cell.didTapBookmarkBtn = { [weak self] in
				cell.isBookmarked ?
				self?.deleteBookmark(with: article) :
				self?.updateBookmarks(with: article)
			}
		}
		return cell
	}
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let newsDetailsController = UIStoryboard(name: "NewsDetails", bundle: nil).instantiateViewController(withIdentifier: "NewsDetails") as? NewsDetailsViewController else {
            return
        }
        if let unwrappedArticles = articles {
            let article = unwrappedArticles[indexPath.row]
            newsDetailsController.article = article
        }
        navigationController?.pushViewController(newsDetailsController, animated: true)
    }
	
}
