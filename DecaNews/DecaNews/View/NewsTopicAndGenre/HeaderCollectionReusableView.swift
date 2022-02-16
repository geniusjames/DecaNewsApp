import UIKit

class FirstHeaderCollectionReusableView: UICollectionReusableView {
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
