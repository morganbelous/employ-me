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
    func notifySignIn()
}

class MainNavigationController: UINavigationController {
    
    var isLoggedIn: Bool!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
  
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        let user = GIDSignIn.sharedInstance()?.currentUser
        
        if (user == nil) {
            isLoggedIn = false
        } else {
            isLoggedIn = true
        }
        
        checkLoginStatus()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func checkLoginStatus() {
        if isLoggedIn {
            //assume logged in
            let vc = TabViewController()
            viewControllers = [vc]
        } else {
            perform(#selector(showLoginController), with: nil, afterDelay: 0.01)
        }
    }

    
    @objc func showLoginController(){
        let loginController = SignInViewController()
        loginController.modalPresentationStyle = .fullScreen
        loginController.delegate = self 
        present(loginController, animated: true, completion: nil)
    }
    
}

extension MainNavigationController: NotifySignInDelegate {
    func notifySignIn() {
        isLoggedIn = true
        checkLoginStatus()
    }
}
