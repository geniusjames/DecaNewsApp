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
	let dashboardVC = DashboardTableViewController()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		articles = dashboardVC.articles
		print(articles)
    }
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		articles?.count ?? 14
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
