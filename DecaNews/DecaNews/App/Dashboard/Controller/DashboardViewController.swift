//
//  DashboardViewController.swift
//  DecaNews
//
//  Created by mac on 06/02/2022.
//

import UIKit

class DashboardViewController: UIViewController {
	
	var coordinator: MainCoordinator?
	var navigateLatestNewsScreen: (() -> Void)?

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
		navigateLatestNewsScreen?()
	}
	
}
