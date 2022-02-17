import UIKit

class TopicsCollectionViewController: UIViewController {
    var serviceViewModel: ServicesViewModel?
    public var collectionViewNews: [Article]?
//    var articles: [Article]? = [Article]()
    private let url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=b48f157c6a94447bbaba425d8774fde3"
    
    let publications = PopularTopicsCollectionViewCell()
    let authorsCollectionView = ThirdCollectionViewCell()
    var red = UIColor(red: 100.0/255.0, green: 130.0/255.0, blue: 230.0/255.0, alpha: 1.0)
    
    @IBOutlet weak var searchBarField: UITextField!
    @IBOutlet weak var circularCollectionView: UICollectionView!
    @IBOutlet weak var cardShapedCollectionView: UICollectionView!
    @IBOutlet weak var authorsCardShapedCollectionView: UICollectionView!
    @IBOutlet weak var clickToSeeMoreAuthorSButton: UIButton!
    @IBAction func seeMoreAuthorsActionButton(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        fetchDataTocell(url: url)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dismissKeyboard()
    }
   
    private func fetchDataTocell(url: String) {
        NetworkManager.shared.networkRequest(url: url)
        { [weak self] response in
            self?.collectionViewNews = response.articles
            DispatchQueue.main.async {
                self?.cardShapedCollectionView.reloadData()
            }
        } errorCompletion: { error in
            print("This is the error displayed: ", error)
        }
    }
    
    func configureView() {
        searchBarField.autocapitalizationType = .none
        searchBarField.autocorrectionType = .no
        searchBarField.returnKeyType = .search
        searchBarField.leftViewMode = UITextField.ViewMode.always
        let imageView = UIImageView()
        let image = UIImage(systemName: "arrow.left")
        imageView.tintColor = .black
        imageView.image = image
//        imageView.leftAnchor.constraint(equalTo: searchBarField.leftAnchor, constant: 12).isActive = true
        searchBarField.leftView = imageView
        searchBarField.rightViewMode = UITextField.ViewMode.always
        let rightIconImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        let rightimage = UIImage(named: "search-normal")
        rightIconImage.image = rightimage
       searchBarField.rightView = rightIconImage
    }
    
}
