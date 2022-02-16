import UIKit

class NewsTopicsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "NewsTopicsCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var newsGenre: UILabel!
    @IBOutlet var circularBackgroundView: UIView!
}
