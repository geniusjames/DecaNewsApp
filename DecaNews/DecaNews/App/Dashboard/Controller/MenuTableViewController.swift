//
//  MenuTableViewController.swift
//  DecaNews
//
//  Created by Decagon on 10/02/2022.
//

import UIKit

class MenuTableViewController: UITableViewController {
    public weak var delegate: MenuControllerDelegate?
    private let menuItem = MenuOption.allCases
    var viewModel: MenuTableViewModel?
    
    var didSelectMenuOption: ((MenuOption) -> Void)?

    init() {
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(UINib(nibName: "SideMenuTableViewCell", bundle: nil), forCellReuseIdentifier: SideMenuTableViewCell.identifier)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .black
        tableView.register(UINib(nibName: "SideMenuTableViewCell", bundle: nil), forCellReuseIdentifier: SideMenuTableViewCell.identifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItem.count + 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuTableViewCell.identifier, for: indexPath) as? SideMenuTableViewCell else {
                return UITableViewCell()
            }
            let user = viewModel?.getUserDetails()
			cell.profileName.text = user?.displayName
//            viewModel?.getImageData(url: (user?.photoURL)!) { data in
//                cell.profileImage.image = UIImage(data: data)
//            }
            cell.profileImage.layer.cornerRadius = cell.profileImage.frame.size.width / 2
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.textColor = UIColor(named: "deepGrey")
            cell.textLabel?.text = menuItem[indexPath.row - 1].displayname
            cell.contentView.backgroundColor = .black
            return cell
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectMenuOption?(menuItem[indexPath.row - 1])
    }

    func isIndexGreaterThanSix(in list: [String]) -> Int {
        return list.count - 1
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 180
        } else {
            return 60
        }
    }

}
