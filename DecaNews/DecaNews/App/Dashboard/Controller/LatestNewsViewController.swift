//
//  LatestNewsViewController.swift
//  DecaNews
//
//  Created by mac on 10/02/2022.
//

import UIKit

class LatestNewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	@IBOutlet weak var tableView: UITableView!
	
	var coordinator: MainCoordinator?
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
		self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "arrow-left")
		self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "arrow-left")
		self.navigationController?.navigationBar.backItem?.title = "from"
		self.navigationController?.navigationBar.backItem?.titleView?.tintColor = .black
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
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		articles?.count ?? 20
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "LatestNewsCell", for: indexPath) as? LatestNewsTableViewCell
		else { return UITableViewCell() }
		if let articles = articles {
			let article = articles[indexPath.row]
			cell.setup(with: article)
		}
		return cell
	}
	
}
