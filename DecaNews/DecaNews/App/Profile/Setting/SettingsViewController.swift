//
//  SettingsViewController.swift
//  DecaNews
//
//  Created by Decagon on 23/02/2022.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "settings", for: indexPath) as? SettingsTableViewCell else {
            return UITableViewCell()}
        return cell
    }
    
}
