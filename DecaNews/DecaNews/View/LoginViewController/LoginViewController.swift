import UIKit
import GoogleSignIn

class LoginViewController: UIViewController {
    var coordinator: MainCoordinator?
    var viewModel: ViewModel?
    @IBOutlet var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        signInButton.frame = CGRect(x: 16, y: 492, width: view.frame.width-32, height: 50)
      
    }
}
