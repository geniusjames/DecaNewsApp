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
	
    var viewModel: DashboardCollectionViewModel?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		config()
	}
	
	private func config() {
		collectionView.dataSource = self
		fetchData(1)
		
		// self.navigationController?.setNavigationBarHidden(true, animated: true)
		
		let tapPopularTab = UITapGestureRecognizer(target: self, action: #selector(didTapPopular))
		popularButton.addGestureRecognizer(tapPopularTab)

		let tapTrendingTab = UITapGestureRecognizer(target: self, action: #selector(didTapTrending))
		trendingButton.addGestureRecognizer(tapTrendingTab)

		let tapRecentTab = UITapGestureRecognizer(target: self, action: #selector(didTapRecent))
		recentButton.addGestureRecognizer(tapRecentTab)
	}
	
    public func fetchData(_ val: Int) {
        viewModel?.fetchData(val) {
			DispatchQueue.main.async { [weak self] in
				self?.collectionView.reloadData()
			}
		} errorCompletion: { error in
			print("Error is: ", error)
			
		}
			
	}
	
	func updateBookmarks(with article: Article) {
        viewModel?.addBookMark(article: article)
	}
	
	func deleteBookmark(with url: String?) {
        viewModel?.deleteBookMark(url: url)
	}
	
	@objc func didTapPopular() {
		popularButton.font = .boldSystemFont(ofSize: 20)
		popularButton.textColor = .black
		trendingButton.font = .systemFont(ofSize: 20)
		trendingButton.textColor = UIColor(named: "deepGrey")
		recentButton.font = .systemFont(ofSize: 20)
		recentButton.textColor = UIColor(named: "deepGrey")
		fetchData(1)
//		DispatchQueue.main.async {
//			self.collectionView.reloadData()
//		}
	}

	@objc func didTapTrending() {
		trendingButton.font = .boldSystemFont(ofSize: 20)
		trendingButton.textColor = .black
		popularButton.font = .systemFont(ofSize: 20)
		popularButton.textColor = UIColor(named: "deepGrey")
		recentButton.font = .systemFont(ofSize: 20)
		recentButton.textColor = UIColor(named: "deepGrey")
		fetchData(2)
//		DispatchQueue.main.async {
//			self.collectionView.reloadData()
//		}
	}

	@objc func didTapRecent() {
		recentButton.font = .boldSystemFont(ofSize: 20)
		recentButton.textColor = .black
		trendingButton.font = .systemFont(ofSize: 20)
		trendingButton.textColor = UIColor(named: "deepGrey")
		popularButton.font = .systemFont(ofSize: 20)
		popularButton.textColor = UIColor(named: "deepGrey")
		fetchData(3)
//		DispatchQueue.main.async {
//			self.collectionView.reloadData()
//		}
	}
	
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  min(viewModel?.collectionViewNews.count ?? 0, 3)
    }
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashBoardCollectionViewCell", for: indexPath) as? DashboardCollectionViewCell else {
			return UICollectionViewCell()
		}
        if let articles = viewModel?.collectionViewNews {
			let article = articles[indexPath.row]
			cell.setup(with: article)
			cell.didTapBookmarkBtn = { [weak self] in
				cell.isBookmarked ?
                self?.deleteBookmark(with: article.url) :
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

extension DashboardCollectionViewController: Storyboardable {
    static var storyboard: Storyboard { .dashboard }
}
