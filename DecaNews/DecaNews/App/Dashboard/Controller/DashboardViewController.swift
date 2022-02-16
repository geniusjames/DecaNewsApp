//
//  DashboardViewController.swift
//  DecaNews
//
//  Created by mac on 06/02/2022.
//

import UIKit
import SideMenu

class DashboardViewController: UIViewController, MenuControllerDelegate {
	
	private var sideMenu: SideMenuNavigationController?
	var navigateLatestNewsScreen: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
		self.navigationController?.setNavigationBarHidden(true, animated: true)
		let menu = MenuTableViewController(with: itemList)
		sideMenu = SideMenuNavigationController(rootViewController: menu)
		menu.delegate = self
		sideMenu?.leftSide = true
		SideMenuManager.default.leftMenuNavigationController = sideMenu
		SideMenuManager.default.addPanGestureToPresent(toView: view)
    }
	
	@IBAction func menuButton(_ sender: Any) {
		present(sideMenu!, animated: true)
	}
	@IBAction func searchButton(_ sender: Any) {
		print("Search button clicked")
	}
	@IBAction func writeNewsButton(_ sender: Any) {
		print("Write button clicked")
	}
	@IBAction func seeMoreButton(_ sender: Any) {
		navigateLatestNewsScreen?()
	}
	
	func didSelectMenuItem(named: String) {
		sideMenu?.dismiss(animated: true, completion: { [weak self] in
			switch named {
			case "Home":
				self?.view.backgroundColor = .white
			case "Saved News":
				self?.view.backgroundColor = .red
			case "Write News":
				self?.view.backgroundColor = .white
			case "Membership":
				self?.view.backgroundColor = .gray
			default:
				return
			}
		})
	}
	
	var itemList: [String] = ["Home",
							  "Saved News",
							  "Write News",
							  "Membership",
							  "Help",
							  "Settings",
							  "Logout",
							  "Version 1.0"
	]
	
}
