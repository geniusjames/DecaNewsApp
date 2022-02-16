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
	
	let firebaseService = FirebaseService()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setUp()
    }
	
	private func setUp() {
		self.navigationController?.setNavigationBarHidden(true, animated: true)
		tableView.delegate = self
		tableView.dataSource = self
		let user = firebaseService.getUserDetails()
		profileName.text = user?.displayName
		profileEmail.text = user?.email
		NetworkManager.shared.getImageDataFrom(url: (user?.photoURL)!, imageCell: displayPicture)
	}

	@IBAction func EditProfileButtonAction(_ sender: Any) {
	}
	
	@IBAction func filterButtonAction(_ sender: Any) {
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as? ProfileTableViewCell
		else { return UITableViewCell() }
		return cell
	}
    
}
