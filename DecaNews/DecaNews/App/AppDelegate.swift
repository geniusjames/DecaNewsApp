import GoogleSignIn
import Firebase
import UIKit

@main

class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    static var standard: AppDelegate? { UIApplication.shared.delegate as? AppDelegate }
    var window: UIWindow?
    var coordinate: AppCoordinator?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        FirebaseApp.configure()
        
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.clientID =
        "1020653200021-se4ko8phdmla3chhpit3nej980a254bb.apps.googleusercontent.com"
        return true
    }
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        guard let auth = user.authentication else { return }
        let credentials = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
        Auth.auth().signIn(with: credentials) { (_ authResult, _ error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Login Successful.")
            }
        }
    }
    func application(_ app: UIApplication, open url: URL, options: [UIApplication
                                                                        .OpenURLOptionsKey: Any] = [:]) -> Bool {
        let handled = GIDSignIn.sharedInstance().handle(url)
        return handled
    }
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}

/*

 */
