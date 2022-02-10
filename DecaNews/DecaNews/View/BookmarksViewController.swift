//
//  BookmarksViewController.swift
//  DecaNews
//
//  Created by Geniusjames on 09/02/2022.
//

import UIKit

class BookmarksViewController: UIViewController {
    @IBOutlet weak var newsTableView: UITableView!
    let viewModel = BookmarksViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.delegate = self
        // Do any additional setup after loading the view.
    }

}
extension BookmarksViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: viewModel.cellID, for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
}
