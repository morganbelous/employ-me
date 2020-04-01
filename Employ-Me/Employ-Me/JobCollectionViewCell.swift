//
//  JobCollectionViewCell.swift
//  Employ-Me
//
//  Created by Morgan Belous on 3/31/20.
//  Copyright © 2020 Morgan Belous. All rights reserved.
//

import UIKit

class JobCollectionViewCell: UICollectionViewCell {
    
    var box: UIView!
    
    var titleLabel: UILabel!
    var nameLabel: UILabel!
    var priceLabel: UILabel!
    var pictureView: UIImageView!
    
    
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        
        
        box = UIView()
        box.translatesAutoresizingMaskIntoConstraints = false
        box.backgroundColor = .white
        box.layer.cornerRadius = 10
        box.layer.shadowColor = UIColor.black.cgColor
        box.layer.shadowRadius = 5
        box.layer.shadowOpacity = 0.4
        box.layer.shadowOffset = CGSize(width: 1, height: 1)
        contentView.addSubview(box)
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor(red: 50/255, green: 162/255, blue: 242/255, alpha: 1)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        contentView.addSubview(titleLabel)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = UIColor(red: 249/255, green: 184/255, blue: 19/255, alpha: 1)
        contentView.addSubview(nameLabel)
        
        priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.textColor = UIColor(red: 87/255, green: 88/255, blue: 89/255, alpha: 1)
        contentView.addSubview(priceLabel)
        
        pictureView = UIImageView()
        pictureView.translatesAutoresizingMaskIntoConstraints = false
        pictureView.contentMode = .scaleAspectFill
        pictureView.clipsToBounds = true
        pictureView.layer.cornerRadius = 10
        contentView.addSubview(pictureView)
        
        
        
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(for job: Job){
        titleLabel.text = job.title
        nameLabel.text = job.name
        priceLabel.text = job.price
        pictureView.image = job.picture
    }
    
    func setUpConstraints(){
        
        NSLayoutConstraint.activate([
            box.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            box.topAnchor.constraint(equalTo: contentView.topAnchor),
            box.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            box.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: box.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: pictureView.trailingAnchor,  constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: box.topAnchor, constant: 50),
            nameLabel.leadingAnchor.constraint(equalTo: pictureView.trailingAnchor,  constant: 20)

        ])
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: box.topAnchor, constant: 80),
            priceLabel.leadingAnchor.constraint(equalTo: pictureView.trailingAnchor,  constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            pictureView.topAnchor.constraint(equalTo: box.topAnchor, constant: 5),
            pictureView.bottomAnchor.constraint(equalTo: box.bottomAnchor, constant: -5),
            pictureView.leadingAnchor.constraint(equalTo: box.leadingAnchor, constant: 5),
            pictureView.widthAnchor.constraint(equalToConstant: contentView.frame.width * 0.4),
            

        ])
   
    }
    
    
    

    
    
}

