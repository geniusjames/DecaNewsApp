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
	var isBookmarked: Bool = false
	
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
//
//    func updateBookmarks(with article: Article, viewModel: DashboardTableViewModel?) {
//        viewModel?.addBookMark(article: article)
//    }
//
//    func deleteBookmark(with article: Article, viewModel: DashboardTableViewModel?) {
//        viewModel?.deleteBookMark(url: article.url)
//    }

    public func setup(with article: Article, viewModel: DashboardTableViewModel?) {
		newsTitle.text = article.title
		authorsName.text = article.author
		if let articleURLString = article.urlToImage,
			let catImageURL = URL(string: articleURLString) {
            NetworkManager().getImageDataFrom(url: catImageURL) { [weak self] data in
                self?.newsImage.image = UIImage(data: data)
            }
		}
        didTapBookmarkBtn = { [weak self] in
            self?.isBookmarked = false
            (self?.isBookmarked ?? false) ?
            viewModel?.deleteBookMark(url: article.url) :
            viewModel?.addBookMark(article: article)
        }
	}
	
	@IBAction func didTapBookMarkBtn(_ sender: Any) {
		isBookmarked ? (isBookmarked = false) : (isBookmarked = true)
		didTapBookmarkBtn?()
	}
}
