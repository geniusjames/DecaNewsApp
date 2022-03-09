//
//  DashboardTableViewController.swift
//  DecaNews
//
//  Created by mac on 08/02/2022.
//

import UIKit

class DashboardTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	@IBOutlet weak var tableView: UITableView!
    
    var didSelectArticle: ((Article) -> Void)?
    
    var viewModel: DashboardTableViewModel?

	override func viewDidLoad() {
        super.viewDidLoad()
		config()
    }
	
	private func config() {
		fetchData()
		tableView.delegate = self
		tableView.dataSource = self
	}
	
	private func fetchData() {
        viewModel?.fetchData() {
			DispatchQueue.main.async { [weak self] in
				self?.tableView.reloadData()
			}
		} errorCompletion: { error in
			print("THE ERROR IS: ", error)
		}
	}
	
	func updateBookmarks(with article: Article) {
        viewModel?.addBookMark(article: article)
	}
	
	func deleteBookmark(with article: Article) {
        viewModel?.deleteBookMark(url: article.url)
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.articles.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardTableViewCell", for: indexPath) as? DashboardTableViewCell
		else { return UITableViewCell() }
		
        if let articles = viewModel?.articles {
			let article = articles[indexPath.row]
			cell.setup(with: article)
			cell.didTapBookmarkBtn = { [weak self] in
                cell.isBookmarked = false
				cell.isBookmarked ?
				self?.deleteBookmark(with: article) :
				self?.updateBookmarks(with: article)
			}
		}
		return cell
	}
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let article = viewModel?.articles[indexPath.row] {
            didSelectArticle?(article)
        }
    }
}

extension DashboardTableViewController: Storyboardable {
    static var storyboard: Storyboard { .dashboard }
}
