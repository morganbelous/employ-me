//
//  JobCollectionViewCell.swift
//  Employ-Me
//
//  Created by Morgan Belous on 3/31/20.
//  Copyright © 2020 Morgan Belous. All rights reserved.
//

import UIKit
import SnapKit

class JobCollectionViewCell: UICollectionViewCell {
    
    var box: UIView!
    
    var titleLabel: UILabel!
    var nameLabel: UILabel!
    var priceLabel: UILabel!
    var pictureView: UIImageView!
    
    
    override init(frame: CGRect){
        super.init(frame: frame)

        
        box = UIView()
        box.backgroundColor = .white
        box.layer.cornerRadius = 10
        box.layer.shadowColor = UIColor.black.cgColor
        box.layer.shadowRadius = 5
        box.layer.shadowOpacity = 0.4
        box.layer.shadowOffset = CGSize(width: 1, height: 1)
        contentView.addSubview(box)
        
        titleLabel = UILabel()
        titleLabel.textColor = UIColor(red: 50/255, green: 162/255, blue: 242/255, alpha: 1)
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        contentView.addSubview(titleLabel)
        
        nameLabel = UILabel()
        nameLabel.textColor = UIColor(red: 249/255, green: 184/255, blue: 19/255, alpha: 1)
        contentView.addSubview(nameLabel)
        
        priceLabel = UILabel()
        priceLabel.textColor = UIColor(red: 87/255, green: 88/255, blue: 89/255, alpha: 1)
        contentView.addSubview(priceLabel)
        
        pictureView = UIImageView()
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
        pictureView.image = UIImage(named: job.imageName)
    }
    
    func setUpConstraints(){
        
        box.snp.makeConstraints { make in
            make.top.bottom.left.equalTo(contentView).offset(5)
            make.right.equalTo(contentView).offset(-5)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(box).offset(10)
            make.left.equalTo(pictureView.snp.right).offset(20)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(box).offset(50)
            make.left.equalTo(pictureView.snp.right).offset(20)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(box).offset(80)
            make.left.equalTo(pictureView.snp.right).offset(20)
        }
        
        
        pictureView.snp.makeConstraints { make in
            make.top.bottom.left.equalTo(box).inset(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 0))
            make.width.equalTo(contentView.frame.width * 0.4)
        }
    }   
}

