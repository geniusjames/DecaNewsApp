import Foundation
import UIKit

class DetailsViewController: UIViewController {
    var coordinator: MainCoordinator?
    var countClickedButtons: Int = 0
//    {
//         didSet {
//              let text = String(countClickedButtons)
//             likeButtons.setTitle(text, for: .normal)
//         }
//    }

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
    @IBAction func likeButton(_ sender: DetailsViewController) {
//        self.likes = !self.likeButtons.isSelected
//        self.likeButtons.isSelected = self.likes
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        newsImage.backgroundColor = .red
        newsText.isEditable = false
//        let range = NSMakeRange(newsText.text.characters.count - 1, 0)
//        newsText.scrollRangeToVisible(range)
//        self.likeButtons.isSelected = self.likes

//              // set the titles for the likes button per state
//              self.likesButton.setTitle("Like", forState: .normal)
//              self.likesButton.setTitle("Likes", forState: .selected)
    }
    
    
    
    
}
