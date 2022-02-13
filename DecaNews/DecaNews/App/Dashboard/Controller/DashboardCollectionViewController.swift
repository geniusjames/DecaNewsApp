//
//  DashboardCollectionViewController.swift
//  DecaNews
//
//  Created by mac on 08/02/2022.
//

import UIKit

class DashboardCollectionViewController: UIViewController, UICollectionViewDataSource {
	
	@IBOutlet weak var collectionView: UICollectionView!
	@IBOutlet weak var popularButton: UILabel!
	@IBOutlet weak var trendingButton: UILabel!
	@IBOutlet weak var recentButton: UILabel!
	
	let directory = ArticleDirectory()
	private let url = "https://newsapi.org/v2/everything?q=apple&from=2022-02-07&to=2022-02-07&sortBy=popularity&apiKey=c47e6bd7b3c74efa885b276cceed84e6"
	private let url2 = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c47e6bd7b3c74efa885b276cceed84e6"
	private let url3 = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=c47e6bd7b3c74efa885b276cceed84e6"
	
	private var collectionViewNews: [Article]?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		config()
	}
	
	private func config() {
		collectionView.dataSource = self
		fetchData(url: url)
		
		self.navigationController?.setNavigationBarHidden(true, animated: true)
		
		let tapPopularTab = UITapGestureRecognizer(target: self, action: #selector(didTapPopular))
		popularButton.addGestureRecognizer(tapPopularTab)

		let tapTrendingTab = UITapGestureRecognizer(target: self, action: #selector(didTapTrending))
		trendingButton.addGestureRecognizer(tapTrendingTab)

		let tapRecentTab = UITapGestureRecognizer(target: self, action: #selector(didTapRecent))
		recentButton.addGestureRecognizer(tapRecentTab)
	}
	
	private func fetchData(url: String) {
		NetworkManager.shared.networkRequest(url: url) { [weak self] response in
			self?.collectionViewNews = response.articles
			DispatchQueue.main.async {
				self?.collectionView.reloadData()
			}
		} errorCompletion: { error in
			print("Error is: ", error)
			
		}
			
	}
	
	func updateBookmarks(with article: Article) {
		directory.updateBookmarks(with: article)
	}
	
	@objc func didTapPopular() {
		popularButton.font = .boldSystemFont(ofSize: 20)
		popularButton.textColor = .black
		trendingButton.font = .systemFont(ofSize: 20)
		trendingButton.textColor = UIColor(named: "deepGrey")
		recentButton.font = .systemFont(ofSize: 20)
		recentButton.textColor = UIColor(named: "deepGrey")
		fetchData(url: url)
		DispatchQueue.main.async {
			self.collectionView.reloadData()
		}
	}

	@objc func didTapTrending() {
		trendingButton.font = .boldSystemFont(ofSize: 20)
		trendingButton.textColor = .black
		popularButton.font = .systemFont(ofSize: 20)
		popularButton.textColor = UIColor(named: "deepGrey")
		recentButton.font = .systemFont(ofSize: 20)
		recentButton.textColor = UIColor(named: "deepGrey")
		fetchData(url: url2)
		DispatchQueue.main.async {
			self.collectionView.reloadData()
		}
	}

	@objc func didTapRecent() {
		recentButton.font = .boldSystemFont(ofSize: 20)
		recentButton.textColor = .black
		trendingButton.font = .systemFont(ofSize: 20)
		trendingButton.textColor = UIColor(named: "deepGrey")
		popularButton.font = .systemFont(ofSize: 20)
		popularButton.textColor = UIColor(named: "deepGrey")
		fetchData(url: url3)
		DispatchQueue.main.async {
			self.collectionView.reloadData()
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		3
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashBoardCollectionViewCell", for: indexPath) as? DashboardCollectionViewCell else {
			return UICollectionViewCell()
		}
		if let articles = collectionViewNews {
			let article = articles[indexPath.row]
			cell.setup(with: article)
			cell.didTapBookmarkBtn = { [weak self] in
				self?.updateBookmarks(with: article)
			}
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
