import UIKit

extension TopicsCollectionViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == circularCollectionView {
            return 8
        } else if collectionView == cardShapedCollectionView {
            return 4
        }
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = circularCollectionView.dequeueReusableCell(withReuseIdentifier: NewsTopicsCollectionViewCell.identifier, for: indexPath) as? NewsTopicsCollectionViewCell else {
            return UICollectionViewCell() }
        cell.backgroundColor = .white
        cell.newsGenre.text = "Technology"
        cell.imageView = UIImageView(image: UIImage(named: "post"))
        
        if collectionView == cardShapedCollectionView {
            guard let cell2 = cardShapedCollectionView.dequeueReusableCell(withReuseIdentifier: PopularTopicsCollectionViewCell.identifier, for: indexPath) as? PopularTopicsCollectionViewCell
            else { return UICollectionViewCell()
            }
            cell2.newsSource.text = "Yahoo! Mail"
            cell2.backgroundColor = .white
            cell2.circularView = publications.seeMoreButton
            cell2.sourceLogo.text = "Y"
            return cell2
        } else if collectionView == authorsCardShapedCollectionView {
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
        }
        return cell
    }
    
  
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//           return CGSize(width: view.frame.size.width, height: 24)
//    }
}

extension TopicsCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("cell was tapped")
    }
    
}
//extension TopicsCollectionViewController: UICollectionViewDelegateFlowLayout {
//    private func firstheaderView() -> UIView {
//        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.circularCollectionView.frame.width, height: 30))
//        view.backgroundColor = .red
//        let text = UILabel()
//        text.text = "Explore Topics"
//        text.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
//        text.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
//        return view
//    }
//     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return  CGSize(width: view.frame.size.width, height: 24)
//      }
//    func collectionView(_ collectionView: UICollectionView, layout viewForHeaderInSection: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> UIView? {
//        if collectionView == circularCollectionView {
//            return self.firstheaderView()
//        }
//        else { return firstheaderView()
//        }
//     }
//}
