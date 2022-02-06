//
//  resetPassWordViewController.swift
//  DecaNews
//
//  Created by Decagon on 02/02/2022.
//

import UIKit

class ResetLinkViewController: UIViewController {
    var coordinator: MainCoordinator?
    var navigateToEmailSignin: (() -> Void)?
    
override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func loginScreen(_ sender: Any) {
        navigateToEmailSignin?()
    }
}
