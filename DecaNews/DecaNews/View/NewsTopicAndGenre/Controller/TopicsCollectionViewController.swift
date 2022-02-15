import UIKit

class TopicsCollectionViewController: UIViewController {
    let publications = PopularTopicsCollectionViewCell()
    let authorsCollectionView = ThirdCollectionViewCell()
    let headers = HeaderCollectionReusableView()
    var red = UIColor(red: 100.0/255.0, green: 130.0/255.0, blue: 230.0/255.0, alpha: 1.0)
//    self.layer.borderColor = red.CGColor
//    let header = HeaderCollectionReusableView()
    @IBOutlet weak var topicsSearchBar: UISearchBar!
    @IBOutlet weak var searchFilterButton: UIButton!
    @IBAction func searchBFilterActionButton(_ sender: Any) {
    }
    @IBOutlet weak var circularCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    @IBOutlet weak var cardShapedCollectionView: UICollectionView!
    
    @IBOutlet weak var authorsCardShapedCollectionView: UICollectionView!
    
    //register cells
    func configureView() {
      
//     circularCollectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
//
        
    }
}

//Header Configuration
//extension TopicsCollectionViewController {
//
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
//        header.configure()
//        return header
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: view.frame.size.width, height: 24)
//    }
//}


//CollectionView configuration
extension TopicsCollectionViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == circularCollectionView {
            return 8
        }
        else if collectionView == cardShapedCollectionView {
            return 4
        }
        return 3
    }
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = circularCollectionView.dequeueReusableCell(withReuseIdentifier: NewsTopicsCollectionViewCell.identifier , for: indexPath) as! NewsTopicsCollectionViewCell
        cell.backgroundColor = .white
        cell.newsTopic.text = "Technology"
        cell.imageView = UIImageView(image: UIImage(named: "post"))
        
        if (collectionView == cardShapedCollectionView) {
            let cell2 = cardShapedCollectionView.dequeueReusableCell(withReuseIdentifier: PopularTopicsCollectionViewCell.identifier, for: indexPath) as! PopularTopicsCollectionViewCell
            cell2.newsSource.text = "Yahoo! Mail"
            cell2.backgroundColor = .white
            cell2.circularView = publications.seeMoreButton
            cell2.sourceLogo.text = "Y"
            return cell2
        }
        else if (collectionView == authorsCardShapedCollectionView){
            let cell3 = authorsCardShapedCollectionView.dequeueReusableCell(withReuseIdentifier: ThirdCollectionViewCell.identifier, for: indexPath) as! ThirdCollectionViewCell
            cell3.authorName = authorsCollectionView.authorName
            cell3.containerView = authorsCollectionView.containerView
            cell3.topBackgroundImage = authorsCollectionView.topBackgroundImage
            cell3.seePostButton = authorsCollectionView.seePostButton
            cell3.profileImage = authorsCollectionView.profileImage
            return cell3
        }
        return cell
    }
    
}


extension TopicsCollectionViewController: UICollectionViewDelegate {
    // handles behavior of the cell...what should happen when a user taps, if a cell is editable or not etc..
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        // handles anyother behavior we want
        print("cell was tapped")
    }
}

extension TopicsCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == circularCollectionView {
            return CGSize(width: 144, height: 144)
        }
        return CGSize(width: 140, height: 168)
    }
//    private func collectionView(collectionView: UICollectionView,
//            layout collectionViewLayout: UICollectionViewLayout,
//            sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        return CGSize(width: 80, height: 90)
//        }
    //Use for interspacing
    internal func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
                return 5
        }

    internal func collectionView(_ collectionView: UICollectionView, layout
                        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
                return 25
        }
    // handles the appearance of the view..the padding and margin between each cell and section
}
