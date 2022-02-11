//
import UIKit
import FirebaseDatabase

class CommentsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let database = Database.database().reference()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var commentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    var coordinator: MainCoordinator?

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
2
        //        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "commentscell", for: indexPath) as? CommentsCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    @IBAction func sendBtnPressed(_ sender: Any) {
    }
    
//    func likeButtonClicked() {
//        
//    }
    
}
