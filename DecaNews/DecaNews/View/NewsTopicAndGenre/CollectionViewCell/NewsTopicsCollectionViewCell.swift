import UIKit

class NewsTopicsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "NewsTopicsCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        newsGenre.sizeToFit()
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
                self.newsGenre.isUserInteractionEnabled = true
                self.newsGenre.addGestureRecognizer(labelTap)
    }
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
            print("labelTapped")
        }
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var newsGenre: UILabel!
    @IBOutlet var circularBackgroundView: UIView!
    func setup(with topics: Topics) {
        imageView.image = topics.image
        newsGenre.text = topics.title
    }
}
