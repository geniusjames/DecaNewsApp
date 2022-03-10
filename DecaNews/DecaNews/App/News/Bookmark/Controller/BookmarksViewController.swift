//
//  BookmarksViewController.swift
//  DecaNews
//
//  Created by Geniusjames on 09/02/2022.
//

import UIKit

class BookmarksViewController: UIViewController {
    
    // MARK: - Coordinator Closures
    var didCompleteBookmark: CoordinatorTransition?
    var didSelectArticle: ((BookmarkArticle) -> Void)?
    @IBOutlet weak var newsTableView: UITableView!
    var viewModel: BookmarksViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.delegate = self
        newsTableView.dataSource = self
    }
}
extension BookmarksViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.bookmarkArticles?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: viewModel.cellID, for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        cell.configureCell(index: indexPath.row)
        cell.removeBookmark = { [self] in
            guard let bookmark = viewModel.bookmarkArticles?[indexPath.row] else {return}
            viewModel.removeBookmark(bookmark: bookmark)
            viewModel.bookmarkArticles?.remove(at: indexPath.row)
            cell.loadNews()
            tableView.deleteRows(at: [indexPath], with: .fade)
            }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let article = viewModel.bookmarkArticles?[indexPath.row]
        else {return}
        didSelectArticle?(article)
    }

}

extension BookmarksViewController: Storyboardable {
    static var storyboard: Storyboard { .news }
}
