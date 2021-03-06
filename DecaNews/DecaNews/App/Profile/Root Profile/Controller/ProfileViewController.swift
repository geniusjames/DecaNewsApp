//
//  ProfileViewController.swift
//  DecaNews
//
//  Created by mac on 16/02/2022.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var displayPicture: UIImageView!
	@IBOutlet weak var profileName: UILabel!
	@IBOutlet weak var profileEmail: UILabel!
	@IBOutlet weak var bio: UILabel!
	
    let dashboardTableVC = DIContainer.makeDashboardTableViewModel()
	let firebaseService = FirebaseService()
	var articles: [Article] = [Article]()
	var userArticles: [Article] = [Article]()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setUp()
    }
	
	private func setUp() {
		self.navigationController?.setNavigationBarHidden(true, animated: true)
		tableView.delegate = self
		tableView.dataSource = self
        articles = dashboardTableVC.articles
        let user = firebaseService.userDetails
		profileName.text = user?.displayName
		profileEmail.text = user?.email
		bio.text = ""
//		NetworkManager().getImageDataFrom(url: (user?.photoURL)!, imageCell: displayPicture)
        NetworkManager().getImageDataFrom(url: (user?.photoURL)!) { [weak self] data in
            self?.displayPicture.image = UIImage(data: data)
        }
        userArticles.append(contentsOf: articles.filter { article in
            article.author == profileName.text
        })
//		for article in articles {
//			if article.author == profileName.text {
//				userArticles.append(article)
//			}
//		}
	}
	
	@IBAction func EditProfileButtonAction(_ sender: Any) {
	}
	
	@IBAction func filterButtonAction(_ sender: Any) {
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		userArticles.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as? ProfileTableViewCell
		else { return UITableViewCell() }
		cell.setup(with: userArticles[indexPath.row])
		return cell
	}
    
}

extension ProfileViewController: Storyboardable {
    static var storyboard: Storyboard { .profile }
}
