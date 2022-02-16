//
//  SearchNewsViewController.swift
//  DecaNews
//
//  Created by Decagon on 15/02/2022.
//

import UIKit

class SearchNewsViewController: UIViewController {
    var visible = false
    @IBOutlet weak var sortByUIView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    var bottomPart: NSLayoutConstraint?
    var upperPart: NSLayoutConstraint?
    
    var sortbyview: SortByUIView?// = SortByUIView(searchNewsViewModel: <#T##SearchNewsViewModel#>)
    var searchNewsViewModel: SearchNewsViewModel?
    
    var searchBy: String?
    private let defaultSearchString = "News"
    
    private var searchNewsDatasource: SearchNewsDatasource<SearchNewsTableViewCell, Article>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchNewsViewModel = SearchNewsViewModel()
        guard let searchNewsViewModel = searchNewsViewModel else {
            return
        }
        sortbyview = SortByUIView(searchNewsViewModel: searchNewsViewModel)
        guard let sortbyview = sortbyview else {
            return
        }
        view.addSubviews(sortbyview)
        sortByUIView.removeFromSuperview()
        bottomPart = sortbyview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        upperPart = sortbyview.topAnchor.constraint(equalTo: view.bottomAnchor)
        bottomPart?.isActive = false
        upperPart?.isActive = true
        sortbyview.anchored(top: nil, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        sortbyview.constrainHeight(constant: 375)
        sortbyview.closePopUp = { [weak self] in
            self?.closeOpen()
        }
        sortbyview.populateTable = { [weak self] in
            
        }
        // Do any additional setup after loading the view.
        
        setup()
    }
    @IBAction func popUpMenu(_ sender: Any) {
        closeOpen()
    }
    @IBAction func clearSearchBox(_ sender: Any) {
    }
    
    @IBAction func backButtonAction(_ sender: Any) {
    }
    func closeOpen() {
        if !visible {
            visible = true
            bottomPart?.isActive = true
            upperPart?.isActive = false
        } else {
            visible = false
            bottomPart?.isActive = false
            upperPart?.isActive = true
        }
    }
    func setup() {
        searchNewsViewModel?.populateTable = { [weak self] in
            self?.populateSearchNews()
        }
        searchNewsViewModel?.fetchNews()
    }
    private func populateSearchNews() {
        if let articles = searchNewsViewModel?.articles {
            searchNewsDatasource = SearchNewsDatasource(cellIdentifier: "tableCell", cellData: articles, configureCell: { (cell, article) in
                cell.setup(cellData: article, category: self.searchBy ?? self.defaultSearchString)
            })
            DispatchQueue.main.async { [weak self] in
                self?.tableView.dataSource = self?.searchNewsDatasource
                self?.tableView.reloadData()
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
