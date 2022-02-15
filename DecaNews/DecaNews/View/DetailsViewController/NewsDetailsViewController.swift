import Foundation
import UIKit

final class DetailsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    @IBOutlet weak var backNavigationButton: UIButton!
    @IBOutlet weak var newsImage: UIImageView!
    @IBAction func bookMarkButton(_ sender: Any) {
    }
    @IBAction func textEditorButton(_ sender: Any) {
    }
    @IBOutlet weak var newsCategory: UIButton!
    @IBOutlet weak var newsMinuteRead: UILabel!
    @IBOutlet weak var timeFromNewsPost: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var usersName: UILabel!
    @IBOutlet weak var imageOfUser: UIImageView!
    @IBOutlet weak var likeButtons: UIButton!
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
    @IBOutlet weak var newsText: UITextView!
    
    var countClickedButtons: Int = 0
    func configureView() {
        view.backgroundColor = .white
        newsImage.backgroundColor = .gray
        newsText.isEditable = false
    }
}
