//
//  DashboardTableViewDatasource.swift
//  DecaNews
//
//  Created by Decagon on 08/03/2022.
//


import UIKit

final class DashboardTableViewDatasource<TCell: UITableViewCell, T>: NSObject, UITableViewDataSource {
    
    
    private var data: [T]
    private var cellIdentifier: String
    private var configureCell: (TCell, T) -> Void
    private let dashboardHeader: String
    private let headerViewModel: DashboardCollectionViewModel?
    
    init(cellIdentifier: String, data: [T], headerViewModel: DashboardCollectionViewModel?, dashboardHeader: String, configureCell: @escaping (TCell, T) -> Void) {
        self.cellIdentifier = cellIdentifier
        self.data = data
        self.configureCell = configureCell
        self.headerViewModel = headerViewModel
        self.dashboardHeader = dashboardHeader
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TCell {
            let data = data[indexPath.row]
            configureCell(cell, data)
            return cell
        }
        return TCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
}
