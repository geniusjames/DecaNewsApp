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
    
    init(with menuItems: [String]) {
        self.menuItem = menuItems
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: ProfileTableViewCell.identifier)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .black
        //            tableView.rowHeight = CGFloat(60.0)
        tableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: ProfileTableViewCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItem.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as? ProfileTableViewCell else {
                return UITableViewCell()
            }
            cell.profileName.text = "Tiana Vetrovs"
            cell.viewProfile.text = "View Profile"
            cell.profileImage.layer.cornerRadius = cell.profileImage.frame.size.width / 2
            cell.profileImage.image = UIImage(named: "profile")
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
