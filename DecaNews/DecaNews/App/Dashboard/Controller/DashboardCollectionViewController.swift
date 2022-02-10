//
//  DashboardCollectionViewController.swift
//  DecaNews
//
//  Created by mac on 08/02/2022.
//

import UIKit

class DashboardCollectionViewController: UIViewController, UICollectionViewDataSource {
	
	@IBOutlet weak var collectionView: UICollectionView!
	
	let dashboardVC = DashboardViewController()
	let networkViewModel = NetworkViewModel()
	
	let urls = [
		"https://newsapi.org/v2/everything?q=apple&from=2022-02-07&to=2022-02-07&sortBy=popularity&apiKey=dc4160da7760457cb32b3b4ed741a876",
		"https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=dc4160da7760457cb32b3b4ed741a876",
		"https://newsapi.org/v2/everything?domains=wsj.com&apiKey=dc4160da7760457cb32b3b4ed741a876"
	]
	
	var popularArticles: [Article]? = [Article]()
	var trendingArticles: [Article]? = [Article]()
	var recentArticles: [Article]? = [Article]()
	
	var collectionViewNews: [Article]?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		config()
	}
	
	private func config() {
		collectionView.dataSource = self
		fetchData(url: urls)
//		
//		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//		layout.minimumInteritemSpacing = 0
//		layout.minimumLineSpacing = 0
//		collectionView!.collectionViewLayout = layout
	}
	
	private func fetchData(url: [String]) {
		for index in 0..<url.count {
			NetworkManager.shared.networkRequest(url: url[index]) { [weak self] response in
				if index == 0 {
					self?.popularArticles = response.articles
				} else if index == 1 {
					self?.trendingArticles = response.articles
				} else {
					self?.recentArticles = response.articles
				}
				DispatchQueue.main.async {
					self?.collectionView.reloadData()
				}
			} errorCompletion: { error in
				print("THE ERROR IS: ", error)
			}
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		popularArticles?.count ?? 3
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashBoardCollectionViewCell", for: indexPath) as? DashboardCollectionViewCell else {
			return UICollectionViewCell()
		}
		if let articles = popularArticles {
			let article = articles[indexPath.row]
			cell.setup(with: article)
		}
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		CGSize(width: view.frame.width, height: view.frame.height)
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
	   return 0.0
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
	   return 0.0
	}
	
}
