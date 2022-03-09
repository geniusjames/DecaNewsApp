//
//  SettingsViewController.swift
//  DecaNews
//
//  Created by Decagon on 23/02/2022.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tableView: UITableView!
    
    private let settingItems = SettingOptions.allCases
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
////
//    private func registerCell() {
//        let cell = UINib(nibName: "SettingsTableViewCell",
//                            bundle: nil)
//        self.tableView.register(cell,
//                                forCellReuseIdentifier: "SettingsTableViewCell")
//    }
//
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settingItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//                let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//                cell.textLabel?.textColor = UIColor(named: AppColors.deepGrey)
//                cell.textLabel?.text = menuItem[indexPath.row].displayname
//                cell.contentView.backgroundColor = .black
//                let imageName = menuItem[indexPath.row].icon
//                if imageName != "" {
//                    cell.imageView?.image = UIImage(named: imageName)
//                }
//                return cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath) as? SettingsTableViewCell else {
            return UITableViewCell()}
        cell.titleLabel.text = settingItems[indexPath.row].displayname
        return cell
    }
    
}

extension SettingsViewController: Storyboardable {
    static var storyboard: Storyboard { .settings }
}

