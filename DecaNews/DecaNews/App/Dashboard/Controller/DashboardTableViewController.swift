//
//  DashboardTableViewController.swift
//  DecaNews
//
//  Created by mac on 08/02/2022.
//

import UIKit

class DashboardTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	@IBOutlet weak var tableView: UITableView!

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
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		articles?.count ?? 10
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "DashboardTableViewCell", for: indexPath) as? DashboardTableViewCell
		else { return UITableViewCell() }
		
		if let articles = articles {
			let article = articles[indexPath.row]
			cell.setup(with: article)
		}
		
		return cell
	}
	
}
