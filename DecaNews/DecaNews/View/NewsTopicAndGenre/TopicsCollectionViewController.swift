import UIKit

class TopicsCollectionViewController: UIViewController {
    var serviceViewModel: ServicesViewModel?
    let publications = PopularTopicsCollectionViewCell()
    let authorsCollectionView = ThirdCollectionViewCell()
    var red = UIColor(red: 100.0/255.0, green: 130.0/255.0, blue: 230.0/255.0, alpha: 1.0)
    
    @IBOutlet weak var topicsSearchBar: UISearchBar!
    @IBOutlet weak var searchFilterButton: UIButton!
    @IBAction func searchFilterButtonAction(_ sender: Any) {}
    @IBOutlet weak var circularCollectionView: UICollectionView!
    @IBOutlet weak var cardShapedCollectionView: UICollectionView!
    @IBOutlet weak var authorsCardShapedCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dismissKeyboard()
    }
    
    func configureView() {
        
        self.topicsSearchBar.autocapitalizationType = .none
        self.topicsSearchBar.autocorrectionType = .no
        self.topicsSearchBar.returnKeyType = .search
    }
}
