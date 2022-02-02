import UIKit
import GoogleSignIn

class LoginViewController: UIViewController {
    var coordinator: MainCoordinator?
    var viewModel: ViewModel?
    @IBOutlet weak var loginWithEmailButtom: UIButton!
    @IBOutlet var signInButton: GIDSignInButton!
    @IBOutlet weak var appleSignIn: UIView!
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        configureGoogleSignInButton()
    }
    func configureGoogleSignInButton() {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        signInButton.style = .wide
    }
}
