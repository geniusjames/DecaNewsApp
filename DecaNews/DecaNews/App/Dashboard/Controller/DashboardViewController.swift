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
   
    var didCompleteOnboarding: CoordinatorTransition?
    var viewModel: DashboardViewModel?
    
    var menu: MenuTableViewController!
    
    var dashboardTableViewController: DashboardTableViewController!
    var dashboardCollectionViewController: DashboardCollectionViewController!
    
    @IBOutlet weak var topContainer: UIView!
    @IBOutlet weak var bottomContainer: UIView!
    
    var didSelectArticle: ((Article) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTopContainer()
        setupBottomContainer()
        setUp()
        
        dashboardTableViewController.didSelectArticle = { [weak self] article in
            self?.didSelectArticle?(article)
        }
    }
    
    private func setupTopContainer() {
        addChild(dashboardCollectionViewController)
        topContainer.addSubview(dashboardCollectionViewController.view)
        dashboardCollectionViewController.view.fillSuperview()
        dashboardCollectionViewController.didMove(toParent: self)
    }
    
    private func setupBottomContainer() {
        addChild(dashboardTableViewController)
        bottomContainer.addSubview(dashboardTableViewController.view)
        dashboardTableViewController.view.fillSuperview()
        dashboardTableViewController.didMove(toParent: self)
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
