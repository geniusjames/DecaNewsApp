import UIKit

class PopularPublications: UICollectionViewCell {
    
    static let identifier = "PopularTopicsCollectionViewCell"
    @IBOutlet var circularView: UIView?
    @IBOutlet var cellBackgroundView: UIView?
    @IBOutlet var seeMoreButton: UIButton!
    @IBOutlet var newsSource: UILabel!
    @IBOutlet var sourceLogo: UILabel!
    @IBAction func seeMoreButtonAction(_ sender: Any) {
        
        guard let urlFromBase = urlFromBase else { return }
        _ = NSURL(string: urlFromBase)
        seeMoreButton.setTitle("See More", for: .normal)
        UIApplication.shared.open(NSURL(string: urlFromBase)! as URL)
    }
    
   override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    var urlFromBase: String?
    public func setUp(with article: Article) {
        newsSource.text = article.source.name ?? ""
        let text = newsSource.text! as String
        let sourceName = text
        let string = sourceName.prefix(1)
        sourceLogo.text = String(Array(string)[0])
    }
    
    func setupTap() {
            let touchDown = UILongPressGestureRecognizer(target: self, action: #selector(didTouchDown))
            touchDown.minimumPressDuration = 0
        circularView?.addGestureRecognizer(touchDown)
        }

        @objc func didTouchDown(gesture: UILongPressGestureRecognizer) {
            if gesture.state == .began {
                circularView?.backgroundColor = .green
            } else if gesture.state == .ended || gesture.state == .cancelled {
                circularView?.backgroundColor = .orange
            }
        }
    func configureView() {
        circularView?.layer.borderWidth = 1
        circularView?.layer.borderColor = UIColor(red: 216/255, green: 96/255,
                                                  blue: 93/255, alpha: 1).cgColor
        cellBackgroundView?.layer.borderWidth = 0.7
        cellBackgroundView?.layer.borderColor = UIColor(red: 163/255, green: 163/255,
                                                        blue: 163/255, alpha: 1).cgColor
        newsSource.adjustsFontSizeToFitWidth = true
    }
}
