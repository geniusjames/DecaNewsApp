//
//  MenuTableViewController.swift
//  DecaNews
//
//  Created by Decagon on 10/02/2022.
//

import UIKit

class MenuTableViewController: UITableViewController {
    public weak var delegate: MenuControllerDelegate?
    var imageList: [String] = [ "home", "Bookmark", "card", "edit", "logout", "card", "settings"]
    private let menuItem: [String]
	let firebaseService = FirebaseService()

    init(with menuItems: [String]) {
        self.menuItem = menuItems
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(UINib(nibName: "SideMenuTableViewCell", bundle: nil), forCellReuseIdentifier: SideMenuTableViewCell.identifier)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .black
        //            tableView.rowHeight = CGFloat(60.0)
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
			let user = firebaseService.getUserDetails()
			cell.profileName.text = user?.displayName
			NetworkManager.shared.getImageDataFrom(url: (user?.photoURL)!, imageCell: cell.profileImage)
            cell.profileImage.layer.cornerRadius = cell.profileImage.frame.size.width / 2
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = menuItem[indexPath.row - 1]

            if indexPath.row - 1 == menuItem.count - 1 {
                cell.textLabel?.textColor = UIColor(named: "deepGrey")
            } else {cell.textLabel?.textColor = .white}

            if indexPath.row - 1 < isIndexGreaterThanSix(in: menuItem) {
                cell.imageView?.image = UIImage(named: imageList[indexPath.row - 1])
            }
            cell.contentView.backgroundColor = .black
            return cell
        }

    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row != 0 {
            let selectedItem = menuItem[indexPath.row]
            if indexPath.row < isIndexGreaterThanSix(in: menuItem) {
                delegate?.didSelectMenuItem(named: selectedItem)
            }
        }

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

extension MenuTableViewController: Storyboardable {
    static var storyboard: Storyboard { .dashboard }
}
