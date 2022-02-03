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
    @IBOutlet weak var errorPage: UILabel!
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

    @IBAction func resetLink(_ sender: Any) {
        if let text = passwordReset.text {
        FirebaseService().resetPassword(text, reset(_:))
        }
    }
    func reset(_ result: Result<Int, Error>) {
        switch result {
        case .success(_:):
            guard let viewController = UIStoryboard(name: "password_reset",
                           bundle: nil).instantiateViewController(withIdentifier: "ResetLinkViewController") as? ResetLinkViewController
             else {return}
            viewController.coordinator = coordinator
            self.coordinator?.controller.pushViewController(viewController, animated: true)
//            coordinator?.openTopics()
        case .failure(let error):
            errorPage.text = error.localizedDescription
//                errorMessageLabel.text = error.localizedDescription
        }

    }
}
