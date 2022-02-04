import UIKit
import GoogleSignIn
import AuthenticationServices

class LoginViewController: UIViewController, ASAuthorizationControllerPresentationContextProviding {
    var coordinator: MainCoordinator?
    var viewModel: ViewModel?
    @IBOutlet weak var loginWithEmailButtom: UIButton!
    @IBOutlet var signInButton: GIDSignInButton!
    @IBOutlet weak var appleSignIn: ASAuthorizationAppleIDButton!
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        configureGoogleSignInButton()
    }
    
    @IBAction func didTapAppleSignIn(_ sender: Any) {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName, .email]

        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()

    }
    
    func configureGoogleSignInButton() {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        signInButton.style = .wide
    }
   
        func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
            return view.window!
        }
        
}

extension LoginViewController: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {

        switch authorization.credential {
        case let credentials as ASAuthorizationAppleIDCredential:
            // break
            let user = User(credentials: credentials)
            performSegue(withIdentifier: "segue", sender: user)
        default: break

        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
    // Handle error.
        if error is ASAuthorizationError {

        print("Authorization Error Occured", error)
        }
    }
}
