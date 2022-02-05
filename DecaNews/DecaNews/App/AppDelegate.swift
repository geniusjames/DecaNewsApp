import GoogleSignIn
import Firebase
import UIKit
@main

class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    static var standard: AppDelegate? { UIApplication.shared.delegate as? AppDelegate }
    var window: UIWindow?

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
//        print("User email: \(user.profile.email ?? "No Email Found")")

    }
    func application(_ app: UIApplication, open url: URL, options: [UIApplication
                    .OpenURLOptionsKey: Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
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
