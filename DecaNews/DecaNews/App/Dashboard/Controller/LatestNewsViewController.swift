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

    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
		setupListeners()
    }
	
	func setupListeners() {
		let dashboardVC = DashboardTableViewController()
		dashboardVC.completion = { [weak self] article in
			self?.articles = article
			print(self?.articles?[0])
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
