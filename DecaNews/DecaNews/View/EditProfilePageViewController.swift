//
//  EditProfilePageViewController.swift
//  DecaNews
//
//  Created by Decagon on 14/02/2022.
//

import UIKit

class EditProfilePageViewController: UIViewController {
    var coordinator: MainAppCoordinator?
    @IBOutlet weak var profileImage: UIImageView!
//    var navigatingToEditProfilePage: (() -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
//        profileImage.image = UIImage(named: "profile")
    }
}
