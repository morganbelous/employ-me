//
//  MainNavigationController.swift
//  Employ-Me
//
//  Created by Morgan Belous on 6/12/20.
//  Copyright © 2020 Morgan Belous. All rights reserved.
//

import UIKit
import GoogleSignIn

protocol NotifySignInDelegate {
    func notifySignIn(userDict: NSDictionary)
}

class MainNavigationController: UINavigationController {
    
   // var isLoggedIn: Bool!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    
  
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        let user = GIDSignIn.sharedInstance()?.currentUser
        
        if (user == nil) {
            //only reach here if not logged in on initial load
           // isLoggedIn = false
            perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
        } else {
            //assume log in
            //only get here on first load if already logged in
           // isLoggedIn = true
            logInUser(userDict: ["name":user?.profile.name! as Any, "email":user?.profile.email! as Any])
        }  
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
//    func checkLoginStatus() {
//        if isLoggedIn {
//            //assume logged in
//            logInUser()
//        } else {
//            perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
//        }
//    }
    
    func logInUser(userDict: NSDictionary) {
        let vc = TabViewController(userDict: userDict)
        viewControllers = [vc]
    }
    
    @objc func showLoginController(){
        let loginController = SignInViewController()
        loginController.modalPresentationStyle = .fullScreen
        loginController.delegate = self
        present(loginController, animated: true, completion: nil)
    }
}

extension MainNavigationController: NotifySignInDelegate {
    //only get here when start signed out. and its only on the first sign in
    func notifySignIn(userDict: NSDictionary) {
       // isLoggedIn = true
        logInUser(userDict: userDict)
        //checkLoginStatus(userDict: userDict)
    }
}
