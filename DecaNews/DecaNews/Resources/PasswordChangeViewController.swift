//
//  PasswordChangeViewController.swift
//  DecaNews
//
//  Created by Geniusjames on 16/02/2022.
//

import UIKit

class PasswordChangeViewController: UIViewController {
    @IBOutlet weak var oldPasswordTextField: HideShowPasswordTextField!
    @IBOutlet weak var newPasswordTextField: HideShowPasswordTextField!
    @IBOutlet weak var passwordConfirmationTextField: HideShowPasswordTextField!
    var didCompletePasswordChange: CoordinatorTransition?
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    func setUpTextFields(){

    }
}
