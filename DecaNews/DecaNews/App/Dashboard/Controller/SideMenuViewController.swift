//
//  MenuTableViewController.swift
//  DecaNews
//
//  Created by Decagon on 10/02/2022.
//

import UIKit

class SideMenuViewController: UITableViewController {
    public weak var delegate: MenuControllerDelegate?
    private let menuItem = MenuOption.allCases
    var viewModel: MenuTableViewModel?
    
    var didSelectMenuOption: ((MenuOption) -> Void)?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .black
        tableView.register(SideMenuHeader.self, forHeaderFooterViewReuseIdentifier: "SideMenuHeader")
        //        tableView.tableFooterView = label
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuTableViewCell.identifier, for: indexPath) as? SideMenuTableViewCell else {
                return UITableViewCell()
            }
            let user = viewModel?.getUserDetails()
            cell.profileName.text = user?.displayName
            cell.profileImage.layer.cornerRadius = cell.profileImage.frame.size.width / 2
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.textColor = UIColor(named: AppColors.deepGrey)
            cell.textLabel?.text = menuItem[indexPath.row].displayname
            cell.contentView.backgroundColor = .black
            let imageName = menuItem[indexPath.row].icon
            if imageName != "" {
                cell.imageView?.image = UIImage(named: imageName)
            }
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: false, completion: {
            self.didSelectMenuOption?(self.menuItem[indexPath.row - 1])
        })
    }
    
    func isIndexGreaterThanSix(in list: [String]) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //        if indexPath.row == 0 {
        //            return 180
        //        } else {
        return 60
        //        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SideMenuHeader") as? SideMenuHeader else {
            return UIView()
        }
        headerView.setHeader(viewModel: viewModel)
        return headerView
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        180
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        60
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label: UILabel = {
            let label = UILabel()
            label.text = "Version 1.0"
            label.textColor = .white
            label.textAlignment = .center
            return label
        }()
        return label
    }
}
