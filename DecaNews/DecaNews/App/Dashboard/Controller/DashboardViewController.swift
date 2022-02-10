//
//  DashboardViewController.swift
//  DecaNews
//
//  Created by mac on 06/02/2022.
//

import UIKit

class DashboardViewController: UIViewController {
	
	@IBOutlet weak var popularTab: UILabel!
	@IBOutlet weak var trendingTab: UILabel!
	@IBOutlet weak var recentTab: UILabel!
	
	var coordinator: MainCoordinator?
//	var collectionVC = DashboardCollectionViewController()

	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	@IBAction func menuButton(_ sender: Any) {
	}
	@IBAction func searchButton(_ sender: Any) {
	}
	@IBAction func writeNewsButton(_ sender: Any) {
	}
	@IBAction func seeMoreButton(_ sender: Any) {
		coordinator?.navigateToLatestNewsScreen()
			
	}
	
}
