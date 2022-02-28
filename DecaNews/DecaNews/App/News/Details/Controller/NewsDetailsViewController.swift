import UIKit

final class NewsDetailsViewController: UIViewController {
    
    var article: Article?
    var serviceViewModel: ServicesViewModel?
    var countClickedButtons: Int = 0
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsCategory: UIButton!
    @IBOutlet weak var newsMinuteRead: UILabel!
    @IBOutlet weak var timeFromNewsPost: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var usersName: UILabel!
    @IBOutlet weak var imageOfUser: UIImageView!
    @IBOutlet weak var likeButtons: UIButton!
    @IBOutlet weak var newsContent: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    @IBAction func backNavigationActionButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func bookMarkButton(_ sender: Any) {
    }
    
    @IBAction func textEditorButton(_ sender: Any) {
    }
    
    @IBAction func likeButton(_ sender: Any) {
        
        if likeButtons.tag == 0 {
            likeButtons.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
            likeButtons.tag = 1
            let text = String(countClickedButtons + 1)
            likeButtons.setTitle(text, for: .normal)
        } else {
            likeButtons.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
            likeButtons.tag = 0
            let text = String(countClickedButtons)
            _ = String(countClickedButtons - 1)
            likeButtons.setTitle(text, for: .normal)
        }
    }
    
    @IBAction func commentButton(_ sender: Any) {
        
    }
    
    func configureView() {
        view.backgroundColor = UIColor(named: "themeWhite")
        newsImage.backgroundColor = .systemGray
        newsContent.isEditable = false
        newsMinuteRead.text = article?.publishedAt
        timeFromNewsPost.text = article?.source.name
        newsTitle.text = article?.title
        usersName.text = article?.author
        newsContent.text = article?.content
        if let newsImages = article?.urlToImage,
           let urlToImages = URL(string: newsImages) {
            NetworkManager().getImageDataFrom(url: urlToImages, imageCell: newsImage)
            usersName.adjustsFontSizeToFitWidth = true
        }
    }
    
}

extension NewsDetailsViewController: Storyboardable {
    static var storyboard: Storyboard { .news }
}
