//
//  DashboardReTableViewController.swift
//  DecaNews
//
//  Created by Decagon on 08/03/2022.
//

import UIKit
import SideMenu

class DashboardReViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var sideMenu: SideMenuNavigationController?
   
    var didCompleteOnboarding: CoordinatorTransition?
    var viewModel: DashboardTableViewModel?
    
    var sideMenuController: SideMenuViewController!
    
    private var dashboardTableDatasource: DashboardTableViewDatasource<DashboardTableViewCell, Article>?
    private let dashboardHeader = "dashboardHeader"
    private let dashboardIdentifier = "DashboardTableViewCell"
    var headerViewModel: DashboardCollectionViewModel?
    
    var didSelectArticle: ((Article) -> Void)?
    
    private var articles: [Article]? {
        didSet {
            runSetup()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        config()
    }
    
    func config() {
        configureTableView()
        configureSideMenu()
        fetchData()
        configureNavigationBar()
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.register(DashboardHeader.self, forHeaderFooterViewReuseIdentifier: dashboardHeader)
        tableView.rowHeight = 115
    }
    
    func configureSideMenu() {
        sideMenu = SideMenuNavigationController(rootViewController: sideMenuController)
        sideMenu?.setNavigationBarHidden(true, animated: false)
        sideMenuController.menuControllerDelegate = self
        sideMenu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
    }
    
    func configureNavigationBar() {
        let searchButton = UIBarButtonItem(image: UIImage(named: "search-normal"), style: .plain,
                                                 target: self, action: #selector(showSideMenu))
        let notificationButton = UIBarButtonItem(image: UIImage(named: "Notification"), style: .plain,
                                            target: self, action: #selector(showSideMenu))
        let menuButton = UIBarButtonItem(image: UIImage(named: "Menu"), style: .plain,
                                                 target: self, action: #selector(showSideMenu))
        navigationItem.leftBarButtonItems = [menuButton]
        navigationItem.rightBarButtonItems = [searchButton, notificationButton]
    }
    
    func fetchData() {
        viewModel?.fetchData(successCompletion: {
            DispatchQueue.main.async { [weak self] in
                self?.articles = self?.viewModel?.articles ?? []
                self?.tableView.reloadData()
            }
        }, errorCompletion: {_ in 
            
        })
    }
        
    @objc func showSideMenu() {
        present(sideMenu!, animated: true)
    }
    
    func runSetup() {
        if let articles = articles {
            self.dashboardTableDatasource = DashboardTableViewDatasource(cellIdentifier: dashboardIdentifier, data: articles, headerViewModel: headerViewModel, dashboardHeader: dashboardHeader) { (cell, article) in
                
                cell.setup(with: article, viewModel: self.viewModel)
            }
            tableView.dataSource = dashboardTableDatasource
        }
    }
}

extension DashboardReViewController: Storyboardable {
    static var storyboard: Storyboard { .dashboardRe }
}

extension DashboardReViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        400
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: dashboardHeader) as? DashboardHeader else { return UIView() }
        headerView.viewModel = headerViewModel
        headerView.setHeaderCollectionViewModel()
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let article = viewModel?.articles[indexPath.row] {
            didSelectArticle?(article)
        }
    }
}

extension DashboardReViewController: MenuControllerDelegate {
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
