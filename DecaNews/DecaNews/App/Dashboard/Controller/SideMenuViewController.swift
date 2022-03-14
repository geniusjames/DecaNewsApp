//
//  MenuTableViewController.swift
//  DecaNews
//
//  Created by Decagon on 10/02/2022.
//

import UIKit

final class SideMenuViewController: UIViewController {
    
    var viewModel: SideMenuViewModel!
    var didSelectMenuOption: ((MenuOption) -> Void)?
    weak var menuControllerDelegate: MenuControllerDelegate?
    
    @IBOutlet weak var sideMenuTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewOnLoad()
    }
    
    private func setupViewOnLoad() {
        sideMenuTable.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.viewIdentifier)
        sideMenuTable.register(SideMenuHeader.self, forHeaderFooterViewReuseIdentifier: SideMenuHeader.viewIdentifier)
        sideMenuTable.register(SideMenuTableViewCell.self, forCellReuseIdentifier: SideMenuTableViewCell.viewIdentifier)
    }
    
    private func selectMenu(at index: Int) {
        let selectedMenu = viewModel.menuItem[index]
        dismiss(animated: false) { [weak self] in
            self?.didSelectMenuOption?(selectedMenu)
        }
    }
}

extension SideMenuViewController: Storyboardable {
    static var storyboard: Storyboard { .sideMenu }
}

extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.menuItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.viewIdentifier, for: indexPath)
        cell.textLabel?.textColor = UIColor(named: AppColors.deepGrey)
        cell.textLabel?.text = viewModel.menuItem[indexPath.row].displayname
        cell.contentView.backgroundColor = UIColor(named: "black")
        let imageName = viewModel.menuItem[indexPath.row].icon
        if imageName != "" {
            cell.imageView?.image = UIImage(named: imageName)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectMenu(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 180.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: SideMenuHeader.viewIdentifier) as? SideMenuHeader else {
            return UIView()
        }
        headerView.setHeader(viewModel: viewModel)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label: UILabel = {
            let label = UILabel()
            label.text = "Version 1.0"
            label.textColor = .white
            label.textAlignment = .left
            return label
        }()
        return label
    }
}
