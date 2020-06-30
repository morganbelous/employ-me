//
//  DetailsViewController.swift
//  Employ-Me
//
//  Created by Morgan Belous on 3/31/20.
//  Copyright © 2020 Morgan Belous. All rights reserved.
//

import UIKit
import SnapKit

class DetailsViewController: UIViewController {
    
    var jobTitle: String
    var jobName: String
    var jobEmail: String
    var jobBio: String
    var jobPrice: String
    var jobImageName: String
    
    var titleLabel: UILabel!
    var nameLabel: UILabel!
    var emailLabel: UILabel!
    var priceLabel: UILabel!
    var bioTextView: UITextView!
    
    var pictureView: UIImageView!
    var pictureBox: UIView!
    
    var moneyImageView: UIImageView!
    var mailImageView: UIImageView!
    
    let pictureWidth: CGFloat = UIScreen.main.bounds.width * 0.3
    let iconWidth: CGFloat = UIScreen.main.bounds.width * 0.1
    
    init(jobTitle: String, jobName: String, jobEmail: String, jobPrice: String, jobBio: String , jobImageName: String ) {
        self.jobTitle = jobTitle
        self.jobName = jobName
        self.jobEmail = jobEmail
        self.jobPrice = jobPrice
        self.jobBio = jobBio
        self.jobImageName = jobImageName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        titleLabel = UILabel()
        titleLabel.text = jobTitle
        titleLabel.textColor = UIColor(red: 77/255, green: 37/255, blue: 187/255, alpha: 1)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(titleLabel)
        
        nameLabel = UILabel()
        nameLabel.text = jobName
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        nameLabel.textColor = UIColor(red: 45/255, green: 119/255, blue: 223/255, alpha: 1)
        view.addSubview(nameLabel)
        
        emailLabel = UILabel()
        emailLabel.text = jobEmail
        emailLabel.font = UIFont.boldSystemFont(ofSize: 20)
        emailLabel.textColor = .black
        view.addSubview(emailLabel)
        
        priceLabel = UILabel()
        priceLabel.text = jobPrice
        priceLabel.font = UIFont.boldSystemFont(ofSize: 20)
        priceLabel.textColor = .black
        view.addSubview(priceLabel)
        
        bioTextView = UITextView()
        bioTextView.text = jobBio
        bioTextView.font = UIFont.boldSystemFont(ofSize: 20)
        bioTextView.textColor = .black
        bioTextView.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(bioTextView)
        
        pictureBox = UIView()
        pictureBox.backgroundColor = .white
        pictureBox.layer.cornerRadius = 10
        pictureBox.layer.shadowColor = UIColor.black.cgColor
        pictureBox.layer.shadowRadius = 5
        pictureBox.layer.shadowOpacity = 0.4
        pictureBox.layer.shadowOffset = CGSize(width: 1, height: 1)
        view.addSubview(pictureBox)
        
        pictureView = UIImageView()
        pictureView.image = UIImage(named: jobImageName)
        pictureView.contentMode = .scaleAspectFill
        pictureView.layer.cornerRadius = 10
        pictureView.clipsToBounds = true
        view.addSubview(pictureView)
    
        moneyImageView = UIImageView()
        moneyImageView.image = UIImage(named: "dollar.png")
        moneyImageView.clipsToBounds = true
        view.addSubview(moneyImageView)
        
        mailImageView = UIImageView()
        mailImageView.image = UIImage(named: "mail.png")
        mailImageView.clipsToBounds = true
        view.addSubview(mailImageView)
        
        setUpConstraints()
    }
    
    func setUpConstraints(){
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view.safeAreaLayoutGuide.snp.top).offset(200)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
            make.left.equalTo(view).offset(20)
        }
               
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.left.equalTo(view).offset(50)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(20)
            make.left.equalTo(view).offset(50)
        }
        
        bioTextView.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(20)
            make.right.equalTo(view).offset(-20)
            make.bottom.equalTo(priceLabel.snp.bottom).offset(500)
            make.left.equalTo(view).offset(18)
        }
        
        pictureView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            make.centerX.equalTo(view)
            make.width.height.equalTo(pictureWidth)
        }
        
        pictureBox.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            make.centerX.equalTo(view)
            make.width.height.equalTo(pictureWidth)
        }
        
        moneyImageView.snp.makeConstraints { make in
            make.right.equalTo(priceLabel.snp.left)
            make.centerY.equalTo(priceLabel.snp.centerY)
            make.width.height.equalTo(iconWidth)
        }
        
        mailImageView.snp.makeConstraints { make in
            make.right.equalTo(emailLabel.snp.left).offset(-2)
            make.centerY.equalTo(emailLabel.snp.centerY).offset(1)
            make.width.height.equalTo(iconWidth)
        }
    }
}


