//
//  DetailsViewController.swift
//  Employ-Me
//
//  Created by Morgan Belous on 3/31/20.
//  Copyright © 2020 Morgan Belous. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var jobTitle: String
    var jobName: String
    var jobEmail: String
    var jobBio: String
    var jobPrice: String
    var jobPicture: UIImage
    
    var titleLabel: UILabel!
    var nameLabel: UILabel!
    var emailLabel: UILabel!
    var priceLabel: UILabel!
    var bioTextView: UITextView!
    
    var pictureView: UIImageView!
    var pictureBox: UIView!
    
    var moneyImageView: UIImageView!
    var mailImageView: UIImageView!
    
    init(jobTitle: String, jobName: String, jobEmail: String, jobPrice: String, jobBio: String, jobPicture: UIImage) {
        self.jobTitle = jobTitle
        self.jobName = jobName
        self.jobEmail = jobEmail
        self.jobPrice = jobPrice
        self.jobBio = jobBio
        self.jobPicture = jobPicture
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Job"
        
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = jobTitle
        titleLabel.textColor = UIColor(red: 50/255, green: 162/255, blue: 242/255, alpha: 1)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        view.addSubview(titleLabel)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = jobName
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        nameLabel.textColor = UIColor(red: 249/255, green: 184/255, blue: 19/255, alpha: 1)
        view.addSubview(nameLabel)
        
        emailLabel = UILabel()
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.text = jobEmail
        emailLabel.font = UIFont.boldSystemFont(ofSize: 20)
        emailLabel.textColor = UIColor(red: 87/255, green: 88/255, blue: 89/255, alpha: 1)
        view.addSubview(emailLabel)
        
        priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.text = jobPrice
        priceLabel.font = UIFont.boldSystemFont(ofSize: 20)
        priceLabel.textColor = UIColor(red: 87/255, green: 88/255, blue: 89/255, alpha: 1)
        view.addSubview(priceLabel)
        
        bioTextView = UITextView()
        bioTextView.translatesAutoresizingMaskIntoConstraints = false
        bioTextView.text = jobBio
        bioTextView.font = UIFont.boldSystemFont(ofSize: 20)
        bioTextView.textColor = UIColor(red: 87/255, green: 88/255, blue: 89/255, alpha: 1)
        bioTextView.font = UIFont.systemFont(ofSize: 18)
        view.addSubview(bioTextView)
        

        pictureView = UIImageView()
        pictureView.translatesAutoresizingMaskIntoConstraints = false
        pictureView.image = jobPicture
        pictureView.contentMode = .scaleAspectFill
        pictureView.layer.cornerRadius = 10
        pictureView.clipsToBounds = true
        view.addSubview(pictureView)
        
        
        pictureBox = UIView()
        pictureBox.translatesAutoresizingMaskIntoConstraints = false
        pictureBox.backgroundColor = .white
        pictureBox.layer.cornerRadius = 10
        pictureBox.layer.shadowColor = UIColor.black.cgColor
        pictureBox.layer.shadowRadius = 5
        pictureBox.layer.shadowOpacity = 0.4
        pictureBox.layer.shadowOffset = CGSize(width: 1, height: 1)
        view.addSubview(pictureBox)
        
        moneyImageView = UIImageView()
        moneyImageView.translatesAutoresizingMaskIntoConstraints = false
        moneyImageView.image = UIImage(named: "dollar.png")
        moneyImageView.clipsToBounds = true
        view.addSubview(moneyImageView)
        
        mailImageView = UIImageView()
        mailImageView.translatesAutoresizingMaskIntoConstraints = false
        mailImageView.image = UIImage(named: "mail.png")
        mailImageView.clipsToBounds = true
        view.addSubview(mailImageView)
        
        
        view.addSubview(pictureView)
        
        setUpConstraints()

    }
    
    func setUpConstraints(){
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,  constant: 200)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,  constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,  constant: 50)
        ])
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 20),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,  constant: 50)
        ])
        
        NSLayoutConstraint.activate([
            bioTextView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20),
            bioTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            bioTextView.bottomAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 500),
            bioTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor,  constant: 18)
        ])
        
        
        NSLayoutConstraint.activate([
            pictureView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            pictureView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pictureView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.3),
            pictureView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.3)
        ])
        
        NSLayoutConstraint.activate([
            pictureBox.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            pictureBox.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pictureBox.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.3),
            pictureBox.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.3)
        ])
        
        NSLayoutConstraint.activate([
            moneyImageView.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            moneyImageView.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
            moneyImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.1),
            moneyImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.1)
        ])
        
        NSLayoutConstraint.activate([
            mailImageView.trailingAnchor.constraint(equalTo: emailLabel.leadingAnchor),
            mailImageView.centerYAnchor.constraint(equalTo: emailLabel.centerYAnchor, constant: 2),
            mailImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.1),
            mailImageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.1)
        ])
          
        
    }


}


