//
//  DashboardViewController.swift
//  DecaNews
//
//  Created by mac on 06/02/2022.
//

import UIKit

protocol DashboardViewControllerDelegate: AnyObject {
	func newsType(string: String)
}

class DashboardViewController: UIViewController {
	
	weak var delegate: DashboardViewControllerDelegate?
	
	var coordinator: MainCoordinator?
	
	var completion: ((String) -> Void)?
//	var netwo

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
