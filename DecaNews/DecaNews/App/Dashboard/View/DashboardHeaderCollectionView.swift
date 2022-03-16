//
//  DashboardHeaderCollectionView.swift
//  DecaNews
//
//  Created by Decagon on 08/03/2022.
//

import UIKit

class DashboardHeaderCollectionView: UICollectionView {
    
    var viewModel: DashboardCollectionViewModel?
    private let collectionCell = "collectionCell"
    private var dashboardDatasource: DashboardHeaderDatasource<DashboardHeaderCollectionViewCell, Article>?
    var articles: [Article]? {
        didSet {
            setup()
        }
    }
//    var pageNumber: Int? {
//        didSet {
//            navigationRules?.changeNavRightButton(pageNumber: pageNumber ?? 0)
//        }
//    }
    
//    weak var navigationRules: NavigationProtocol?
    
//    lazy var signInGesture: UISwipeGestureRecognizer = {
//        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(shouldSignInSwipe))
//        swipe.direction = .left
//        swipe.delegate = self
//        return swipe
//    }()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        delegate = self
        layer.cornerRadius = 30
        isPagingEnabled = true
        register(DashboardHeaderCollectionViewCell.self, forCellWithReuseIdentifier: collectionCell)
//        config()
//        addGestureRecognizer(signInGesture)
    }
    
    func config() {
        fetchData(1)
        
        // self.navigationController?.setNavigationBarHidden(true, animated: true)
        
//        let tapPopularTab = UITapGestureRecognizer(target: self, action: #selector(didTapPopular))
//        popularButton.addGestureRecognizer(tapPopularTab)
//
//        let tapTrendingTab = UITapGestureRecognizer(target: self, action: #selector(didTapTrending))
//        trendingButton.addGestureRecognizer(tapTrendingTab)
//
//        let tapRecentTab = UITapGestureRecognizer(target: self, action: #selector(didTapRecent))
//        recentButton.addGestureRecognizer(tapRecentTab)
    }
    
    public func fetchData(_ val: Int) {
        viewModel?.fetchData(val) {
            DispatchQueue.main.async { [weak self] in
                self?.articles = self?.viewModel?.collectionViewNews
                self?.reloadData()
            }
        } errorCompletion: { error in
            print("Error is: ", error)
            
        }
            
    }
    
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        let pageNumber = Int(targetContentOffset.pointee.x / frame.width)
//        self.pageNumber = pageNumber
//    }
    
//    @objc
//    func shouldSignInSwipe() {
//        if let pageNumber = pageNumber, pageNumber + 1 == onboardingData?.count {
//            navigationRules?.signIn()
//        }
//    }
    
    func setup() {
        if let articles = articles {
            self.dashboardDatasource = DashboardHeaderDatasource(cellIdentifier: collectionCell, data: articles) { (cell, article) in
                
                cell.updateData(article: article)
            }
            dataSource = dashboardDatasource
        }
        showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DashboardHeaderCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
    }
}

//extension DashboardHeaderCollectionView: UIGestureRecognizerDelegate {
//  func gestureRecognizer(
//    _ gestureRecognizer: UIGestureRecognizer,
//    shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer
//  ) -> Bool {
//    return true
//  }
//}
