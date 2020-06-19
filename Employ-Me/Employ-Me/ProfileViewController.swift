//
//  ProfileViewController.swift
//  Employ-Me
//
//  Created by Morgan Belous on 6/12/20.
//  Copyright © 2020 Morgan Belous. All rights reserved.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    var box: UIView!
    
    var nameLabel: UILabel!
    var emailLabel: UILabel!
    var addJobButton: UIButton!
    var name: String!
    var email: String!
    
    init(name: String, email: String){
        self.name = name
        self.email = email
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        box = UIView()
        box.backgroundColor = UIColor(red: 50/255, green: 162/255, blue: 242/255, alpha: 1)
        view.addSubview(box)
        
        nameLabel = UILabel()
        nameLabel.text = name
        nameLabel.font =  UIFont.boldSystemFont(ofSize: 20)
        nameLabel.textColor = .black
        view.addSubview(nameLabel)
        
        
        emailLabel = UILabel()
        emailLabel.text = email
        emailLabel.font =  UIFont.boldSystemFont(ofSize: 16)
        emailLabel.textColor = .black
        view.addSubview(emailLabel)
        
        addJobButton = UIButton()
        addJobButton.backgroundColor = .black
        addJobButton.setTitle("+", for: .normal)
        addJobButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        addJobButton.layer.shadowColor = UIColor.black.cgColor
        addJobButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        addJobButton.layer.cornerRadius = 50
        addJobButton.layer.shadowOpacity = 0.4
        addJobButton.layer.shadowRadius = 5
        addJobButton.addTarget(self, action: #selector(presentAddJobViewController), for: .touchUpInside)
        view.addSubview(addJobButton)
        
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           navigationController?.setNavigationBarHidden(true, animated: animated)
       }
    
    func setupConstraints() {
        box.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.width.equalTo(view)
            make.height.equalTo(view.frame.height * 0.4)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view.safeAreaLayoutGuide.snp.top).offset(200)
        }
        
        emailLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(nameLabel.snp.bottom).offset(20)
        }
        
        addJobButton.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(100)
            make.centerY.equalTo(box.snp.bottom)
            make.centerX.equalTo(view)
        }
    }
    
    @objc func presentAddJobViewController(){
        let addJobViewController = AddJobViewController()
        addJobViewController.delegate = self
        present(addJobViewController, animated: true, completion: nil)
    }
}

extension ProfileViewController: AddJobViewControllerDelegate {
    func willBeDismissed() {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "Reload Jobs"), object: nil)
    }
}
