import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "HeaderCollectionReusableView"
    let textheader = ["Explore Topics", "Category two", "Category three"]

    lazy var header: UILabel = {
        var header = UILabel(frame: CGRect(x: 100, y: 100, width: 0, height: 0))
        header.font = UIFont.systemFont(ofSize: 18)
        header.text = "Explore Topics"
        header.textColor = .label
        header.textAlignment = .left
        return header
    }()

    public func configure() {
        addSubview(header)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        header.frame = bounds
    }
}


//public func setup(with article: Article) {
//    newsTitle.text = article.title
//    authorsName.text = article.author
//    if let articleURLString = article.urlToImage,
//        let catImageURL = URL(string: articleURLString) {
//        NetworkManager().getImageDataFrom(url: catImageURL, imageCell: newsImage)
//    }
//}
