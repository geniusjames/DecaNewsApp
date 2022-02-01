//
//  AppDelegate.swift
//  TODO_APP
//
//  Created by Decagon on 10/12/2021.
//

import UIKit
import Firebase
import GoogleSignIn
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    static var standard: AppDelegate? { UIApplication.shared.delegate as? AppDelegate }
    var window: UIWindow?

	func application(
		_ application: UIApplication,
		didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
	) -> Bool {
        FirebaseApp.configure()
        GIDSignIn.sharedInstance()?.clientID = "1020653200021-se4ko8phdmla3chhpit3nej980a254bb.apps.googleusercontent.com"
		return true
	}
    //1020653200021-se4ko8phdmla3chhpit3nej980a254bb.apps.googleusercontent.com

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}
