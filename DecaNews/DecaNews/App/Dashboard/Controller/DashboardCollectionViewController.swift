//
//  DashboardCollectionViewController.swift
//  DecaNews
//
//  Created by mac on 08/02/2022.
//

import UIKit

class DashboardCollectionViewController: UIViewController, UICollectionViewDataSource {
	
	@IBOutlet weak var collectionView: UICollectionView!
	
	let images = ["Bookmark", "Search", "Menu"]
	let popularNewsUrl = "https://newsapi.org/v2/everything?q=apple&from=2022-02-07&to=2022-02-07&sortBy=popularity&apiKey=c47e6bd7b3c74efa885b276cceed84e6"
	
	let recentNewsUrl = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=c47e6bd7b3c74efa885b276cceed84e6"
	let trendingNewsUrl = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=c47e6bd7b3c74efa885b276cceed84e6"
	
	var articles: [Article]!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		collectionView.dataSource = self
		collectionView.register(DashboardCollectionViewCell.self, forCellWithReuseIdentifier: "DashboardCollectionView")
		networkCall(popularNewsUrl)
		networkCall(recentNewsUrl)
		networkCall(trendingNewsUrl)
    }
	
	private func networkCall(_ url: String) {
		NetworkManager.shared.networkRequest(url: url) { [weak self] response in
//			self.jsonResponseHandler(response)
			for num in 0..<response["articles"].count - 1 {
				self?.articles.append(response["articles"][num].rawValue as Any)
				
//				print("Response \(response["articles"][num])")
			}
			print(self?.articles[0] as Any)
			
		} errorCompletion: { error in
			print("Error \(error)")
		}
	}
	
//	func jsonResponseHandler() {
//		let data = Article()
//		print(articles ?? [])
//	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		3
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashboardCollectionView", for: indexPath) as? DashboardCollectionViewCell else {
				return UICollectionViewCell()
			}
		cell.newsImage?.image = UIImage(systemName: images[indexPath.row])
		cell.newsTitle?.text = images[indexPath.row]
		return cell
	}
	
}
