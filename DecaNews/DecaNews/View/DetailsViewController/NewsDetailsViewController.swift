import Foundation
import UIKit

class DetailsViewController: UIViewController {
    var coordinator: MainCoordinator?
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
    @IBAction func likeButton(_ sender: Any) {
    }
    
    @IBAction func commentButton(_ sender: Any) {
    }
    
    @IBOutlet weak var newsText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        newsImage.backgroundColor = .red
    }
    
    
    
}
