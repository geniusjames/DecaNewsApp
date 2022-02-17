import UIKit

class PopularTopicsCollectionViewCell: UICollectionViewCell {
    @IBOutlet var circularView: UIView?
    @IBOutlet var cellBackgroundView: UIView?
    @IBOutlet var seeMoreButton: UIButton!
    @IBOutlet var newsSource: UILabel!
    @IBOutlet var sourceLogo: UILabel!
    @IBAction func seeMoreButtonAction(_ sender: Any) {
    }
    
    static let identifier = "PopularTopicsCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        circularView?.layer.borderWidth = 1
        circularView?.layer.borderColor = UIColor(red: 216/255, green: 96/255,
                                                  blue: 93/255, alpha: 1).cgColor
        cellBackgroundView?.layer.borderWidth = 1
        cellBackgroundView?.layer.borderColor = UIColor(red: 163/255, green: 163/255,
                                                        blue: 163/255, alpha: 1).cgColor
    }
    var newsSourceName = ""
//    func setupMyView(with article: Article) {
//        newsSourceName = newsSource.text ?? ""
//        newsSourceName = article.source.name ?? "Yahoo"
//        let firstLetterOfSourceName = newsSourceName.first?.description ?? ""
//        sourceLogo.text = firstLetterOfSourceName
//    }
    private func setUp(with article: Article) {
        newsSource.text = article.source.name ?? ""
        let text = newsSource.text
        let sourceName = text
        let string = sourceName?.prefix(1)
        sourceLogo.text = string
        
        // output: "a"
//        if let urlLink = article.url,
//           let _ = URL(string: urlLink){
//            seeMoreButton.accessibilityIdentifier = urlLink
//        }
        
    }
}

//
//func setup(with article: Article) {
//    newsTitle?.text = article.title
//    authorsName?.text = article.author
//    if let articleURLString = article.urlToImage,
//        let catImageURL = URL(string: articleURLString) {
//        NetworkManager().getImageDataFrom(url: catImageURL, imageCell: newsImage)
//    }
//}
