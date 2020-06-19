//
//  AppDelegate.swift
//  Employ-Me
//
//  Created by Morgan Belous on 3/31/20.
//  Copyright © 2020 Morgan Belous. All rights reserved.
//

import UIKit
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        GIDSignIn.sharedInstance()?.clientID = "1079096784974-4debgmp175bepc8dfmbnaqpkb0k55miu.apps.googleusercontent.com"
        GIDSignIn.sharedInstance()?.delegate = self
        
        //GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        //let user = GIDSignIn.sharedInstance()?.currentUser
        //let newVC = user == nil ? SignInViewController() : UINavigationController(rootViewController: TabViewController())
        window = UIWindow(frame: UIScreen.main.bounds)
        //window?.rootViewController = newVC
        window?.rootViewController = MainNavigationController()
        window?.makeKeyAndVisible()
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
            print("The user has not signed in before or they have since signed out.")
        } else {
            print("\(error.localizedDescription)")
        }
        return

        }
        // Perform any operations on signed in user here.
        //let userId = user.userID                  // For client-side use only!
        //let idToken = user.authentication.idToken // Safe to send to the server
        let fullName = user.profile.name  ?? "no name"
        //let givenName = user.profile.givenName
        let email = user.profile.email ?? "no email"
    
        
        let userDict:[String: String] = ["name": fullName, "email": email]
        //print("signed in")
        NotificationCenter.default.post(name: Notification.Name(rawValue: "SuccessfulSignInNotification"),
        object: nil, userInfo: userDict)
    }
    

    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!,
              withError error: Error!) {
      // Perform any operations when the user disconnects from app here.
      NotificationCenter.default.post(
        name: Notification.Name(rawValue: "ToggleAuthUINotification"), object: nil, userInfo: ["statusText": "User has disconnected."])
    }
}



