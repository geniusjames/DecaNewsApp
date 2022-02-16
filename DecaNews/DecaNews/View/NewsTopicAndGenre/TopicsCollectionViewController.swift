import UIKit

class TopicsCollectionViewController: UIViewController {
    let newsCategories: [String] = ["Trending", "Beauty", "Politics", "Fashion", "Education", "Food", "Lifestyle", "Technology"]
    public var collectionViewNews: [Article]?

    var articles: [Article]? = [Article]()
    var serviceViewModel: ServicesViewModel?
    let publications = PopularTopicsCollectionViewCell()
    let authorsCollectionView = ThirdCollectionViewCell()
    let headers = HeaderCollectionReusableView()
    var red = UIColor(red: 100.0/255.0, green: 130.0/255.0, blue: 230.0/255.0, alpha: 1.0)
//    self.layer.borderColor = red.CGColor
//    let header = HeaderCollectionReusableView()
    @IBOutlet weak var topicsSearchBar: UISearchBar!
    @IBOutlet weak var searchFilterButton: UIButton!
    @IBAction func searchFilterButtonAction(_ sender: Any) {
    }
    @IBOutlet weak var circularCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        circularCollectionView.directionalLayoutMargins = .zero
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dismissKeyboard()
    }
    
    @IBOutlet weak var cardShapedCollectionView: UICollectionView!
    
    @IBOutlet weak var authorsCardShapedCollectionView: UICollectionView!
    
    public func fetchData(url: String) {
        NetworkManager.shared.networkRequest(url: url) { [weak self] response in
            self?.collectionViewNews = response.articles
            DispatchQueue.main.async {
                self?.cardShapedCollectionView.reloadData()
            }
        } errorCompletion: { error in
            print("Error is: ", error)
        }

    }
    
    func configureView() {
        self.topicsSearchBar.autocapitalizationType = .none
        self.topicsSearchBar.autocorrectionType = .no
        self.topicsSearchBar.returnKeyType = .search
    }
}

//CollectionView configuration
extension TopicsCollectionViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == circularCollectionView {
            return 4
    }
        else if collectionView == cardShapedCollectionView {
            return self.articles?.count ?? 0
        }
        return 2
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = circularCollectionView.dequeueReusableCell(withReuseIdentifier: NewsTopicsCollectionViewCell.identifier, for: indexPath) as? NewsTopicsCollectionViewCell else {
            return UICollectionViewCell() }
        cell.backgroundColor = .white
        cell.newsGenre.text = "Technology"
        cell.imageView = UIImageView(image: UIImage(named: "post"))
        return cell
       if collectionView == authorsCardShapedCollectionView {
        guard let cell3 = authorsCardShapedCollectionView.dequeueReusableCell(withReuseIdentifier: ThirdCollectionViewCell.identifier, for: indexPath) as? ThirdCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell3.authorName = authorsCollectionView.authorName
        cell3.containerView = authorsCollectionView.containerView
        cell3.topBackgroundImage = authorsCollectionView.topBackgroundImage
        cell3.seePostButton = authorsCollectionView.seePostButton
        cell3.profileImage = authorsCollectionView.profileImage
        return cell3
    } else if collectionView == cardShapedCollectionView {
            guard let cell2 = cardShapedCollectionView.dequeueReusableCell(withReuseIdentifier: PopularTopicsCollectionViewCell.identifier, for: indexPath) as? PopularTopicsCollectionViewCell
        else { return UICollectionViewCell()
        }
            if let articles = collectionViewNews {
                let article = articles[indexPath.item]
                cell2.setupMyView(with: article)
            }
            return cell2
            }
    }
}

extension TopicsCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        // handles anyother behavior we want
        print("cell was tapped")
    }
}

extension TopicsCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == circularCollectionView {
            return CGSize(width: CGFloat((collectionView.frame.size.width ) - 20), height: CGFloat(144))
        }
        return CGSize(width: 150, height: 150)
    }
    //Use for interspacing
    internal func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
                return 5
        }

    internal func collectionView(_ collectionView: UICollectionView, layout
                        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        //SPACE BETWEEN TOP nd down
                return 5
        }
//   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: CGFloat((collectionView.frame.size.width ) - 20), height: CGFloat(144))
//    }
    // handles the appearance of the view..the padding and margin between each cell and section
}
