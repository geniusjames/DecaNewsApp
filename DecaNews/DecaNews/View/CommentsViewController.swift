//
//  CommentsViewController.swift
//  DecaNews
//
//  Created by Decagon on 20/02/2022.
//

import UIKit

class CommentsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let commentViewModel = CommentViewModel()
    var didCompleteComments: CoordinatorTransition?
    var count = 0
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var commentTextField: UITextField!
    
    var totalComments: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        reloadTableView()

        totalComments = 15

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "commentscell", for: indexPath) as? CommentsCell else {
            return UITableViewCell()
        }
        cell.configureCell(index: indexPath.row)
        return cell
    }
    @IBAction func sendBtnPressed(_ sender: Any) {
        
        guard let text = commentTextField.text else {return}
        let model = CommentModel(id: 123, articleId: "234", usersName: "ebele", commentText: text, dateAndTime: Date(), liked: false)
        commentViewModel.add(comment: model)
        commentTextField.text = ""
        reloadTableView()
    }

    func reloadTableView() {
        commentViewModel.readComments { comments in
           
            self.count = comments.count
            self.tableView.reloadData()
        }
        tableView.reloadData()
    }
    
}
