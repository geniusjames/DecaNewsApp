//
//  Password_resetViewController.swift
//  DecaNews
//
//  Created by Decagon on 24/01/2022.
//

import UIKit

class PasswordResetViewController: UIViewController {
    var coordinator: MainCoordinator?
    @IBOutlet weak var passwordReset: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordResetProperties()
        // Do any additional setup after loading the view.
    }
    func passwordResetProperties() {
        passwordReset.layer.borderColor = UIColor(named: "deepPeach")?.cgColor
        passwordReset.layer.borderWidth = 1
        passwordReset.layer.cornerRadius = 10
    }

}
