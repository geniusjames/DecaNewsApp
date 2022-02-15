//
//  DashboardViewController.swift
//  DecaNews
//
//  Created by mac on 06/02/2022.
//

import UIKit
import SideMenu

class DashboardViewController: UIViewController {
	
	private var sideMenu: SideMenuNavigationController?
	// var coordinator: MainCoordinator?
	var navigateLatestNewsScreen: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
		self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
	
	@IBAction func menuButton(_ sender: Any) {
		print("Menu button clicked")
//		present(sideMenu!, animated: true)
	}
	@IBAction func searchButton(_ sender: Any) {
		print("Menuc button clicked")
//		present(sideMenu!, animated: true)
	}
	@IBAction func writeNewsButton(_ sender: Any) {
		print("Menub button clicked")
//		present(sideMenu!, animated: true)
	}
	@IBAction func seeMoreButton(_ sender: Any) {
		navigateLatestNewsScreen?()
	}
	
}
