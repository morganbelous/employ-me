//
//  SignInViewController.swift
//  Employ-Me
//
//  Created by Morgan Belous on 6/11/20.
//  Copyright © 2020 Morgan Belous. All rights reserved.
//

import UIKit
import GoogleSignIn
import SnapKit

class SignInViewController: UIViewController {
    
    var titleLabel: UILabel!
    var gSignIn: GIDSignInButton!
    
    var delegate: NotifySignInDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(didSignIn), name: NSNotification.Name("SuccessfulSignInNotification"), object: nil)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor(red: 50/255, green: 162/255, blue: 242/255, alpha: 1).cgColor, UIColor.white.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0) // Top left corner.
        gradientLayer.endPoint = CGPoint(x: 1, y: 1) // Bottom right corner.
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
       
        
        gSignIn = GIDSignInButton()
        view.addSubview(gSignIn)
        
//        let signOut = UIButton(frame: CGRect(x: 50, y: 50, width: 100, height: 30))
//        signOut.backgroundColor = .red
//        signOut.setTitle("Sign Out", for: .normal)
//        signOut.center = view.center
//        signOut.center.y = view.center.y + 100
//        signOut.addTarget(self, action: #selector(didTapSignOut(_:)), for: .touchUpInside)
//        view.addSubview(signOut)
        
        titleLabel = UILabel()
        titleLabel.text = "Employ Me"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(titleLabel)
        
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func setupConstraints(){
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(gSignIn.snp.centerX)
            make.bottom.equalTo(gSignIn.snp.top).offset(-20)
        }
        
        gSignIn.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.width.equalTo(230)
            make.height.equalTo(48)
        }
    }
    
    @IBAction func didTapSignOut(_ sender: AnyObject) {
        print("Signing out")
      GIDSignIn.sharedInstance().signOut()
    }
    
    @objc func didSignIn()  {
        delegate?.notifySignIn()
        dismiss(animated: true, completion: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
