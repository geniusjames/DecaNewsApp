//
//  DashboardCollectionViewCell.swift
//  DecaNews
//
//  Created by mac on 08/02/2022.
//

import UIKit

class DashboardCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet weak var newsTitle: UILabel!
	@IBOutlet weak var newsImage: UIImageView!
	@IBOutlet weak var authorsImage: UIImageView!
	@IBOutlet weak var authorsName: UILabel!
	@IBOutlet weak var estimatedReadTime: UILabel!
	@IBOutlet weak var topic: UILabel!
	@IBOutlet weak var bookmarkBtn: UIButton!
	
	var didTapBookmarkBtn: (() -> Void)?
	var isBookmarked: Bool = false
	
	public func setup(with article: Article) {
		newsTitle.text = article.title
		authorsName.text = article.author
		if let articleURLString = article.urlToImage,
			let catImageURL = URL(string: articleURLString) {
//			NetworkManager().getImageDataFrom(url: catImageURL, imageCell: newsImage)
            NetworkManager().getImageDataFrom(url: catImageURL) { [weak self] data in
                self?.newsImage.image = UIImage(data: data)
            }
		}
	}
	
	@IBAction func bookmarkButton(_ sender: Any) {
		isBookmarked ? (isBookmarked = false) : (isBookmarked = true)
		didTapBookmarkBtn?()
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		newsImage.image = nil
	}
	
}
