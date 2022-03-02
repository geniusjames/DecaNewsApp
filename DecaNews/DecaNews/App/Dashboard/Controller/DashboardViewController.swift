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
    var menu: MenuTableViewController!
    var didCompleteOnboarding: CoordinatorTransition?
    var viewModel: DashboardViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
		setUp()
    }
	
	func setUp() {
		self.navigationController?.setNavigationBarHidden(true, animated: true)
		sideMenu = SideMenuNavigationController(rootViewController: menu)
		menu.delegate = self
		sideMenu?.leftSide = true
		SideMenuManager.default.leftMenuNavigationController = sideMenu
		SideMenuManager.default.addPanGestureToPresent(toView: view)
        _ = viewModel?.bookmarks ?? []
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
//		coordinator.loadLatestNewsScreen()
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
}

extension DashboardViewController: Storyboardable {
    static var storyboard: Storyboard { .dashboard }
}
