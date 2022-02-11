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
    let store = FireStorePersistence(collectionName: "news")
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.delegate = self
        store.read(model: News.init(author: "", title: "", articleDescription: "", url: "", urlToImage: "", publishedAt: "", content: ""))
    }
}
extension BookmarksViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: viewModel.cellID, for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        cell.configureCell(index: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    @objc func pushToDetailScreen() {
        
    }
}
