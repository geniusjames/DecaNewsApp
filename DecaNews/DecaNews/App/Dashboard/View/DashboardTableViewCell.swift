//
//  DashboardTableViewCell.swift
//  DecaNews
//
//  Created by mac on 08/02/2022.
//

import UIKit

class DashboardTableViewCell: UITableViewCell {
	
	@IBOutlet weak var newsImage: UIImageView!
	@IBOutlet weak var topicLabel: UILabel!
	@IBOutlet weak var newsTitle: UILabel!
	@IBOutlet weak var authorsName: UILabel!
	@IBOutlet weak var estimatedReadTime: UILabel!
	@IBOutlet weak var bookmarkBtn: UIButton!
	
	var didTapBookmarkBtn: (() -> Void)?
	
    override func awakeFromNib() {
        super.awakeFromNib()
        
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(bookmarkButtonTapped))
		bookmarkBtn.addGestureRecognizer(tapGesture)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	func setup(with article: Article) {
		newsTitle.text = article.title
		authorsName.text = article.author
		if let articleURLString = article.urlToImage,
			let catImageURL = URL(string: articleURLString) {
			NetworkManager().getImageDataFrom(url: catImageURL, imageCell: newsImage)
		}
	}
	
	@objc func bookmarkButtonTapped() {
		didTapBookmarkBtn?()
	}

}
