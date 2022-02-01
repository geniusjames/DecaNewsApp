import UIKit
import GoogleSignIn

class LoginViewController: UIViewController {
    var coordinator: MainCoordinator?
    @IBOutlet var signInButton: GIDSignInButton!
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        GIDSignIn.sharedInstance().presentingViewController = self
    }
}
