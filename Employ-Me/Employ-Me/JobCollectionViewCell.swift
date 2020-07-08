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
    
    var titleLabel: UILabel!
    var nameLabel: UILabel!
    var priceLabel: UILabel!
    var base64Image: UIImage!
    var pictureView: UIImageView!
    
    override init(frame: CGRect){
        super.init(frame: frame)

        // shadow
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 1.0
        self.layer.cornerRadius = 3
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        
        // round corners
        self.contentView.layer.cornerRadius = 12.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        
        titleLabel = UILabel()
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        contentView.addSubview(titleLabel)
        
        nameLabel = UILabel()
        nameLabel.textColor = .white
        contentView.addSubview(nameLabel)
        
        priceLabel = UILabel()
        priceLabel.textColor = .white
        contentView.addSubview(priceLabel)
        
        pictureView = UIImageView()
        pictureView.contentMode = .scaleAspectFill
        pictureView.clipsToBounds = true
        pictureView.layer.cornerRadius = 10
        contentView.addSubview(pictureView)
          
        setUpConstraints()
        gradientBackgroundColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(for job: Job){
        titleLabel.text = job.title
        nameLabel.text = job.name
        priceLabel.text = job.price
        // decode string
        let newImageData = Data(base64Encoded: job.imageName)
        if let newImageData = newImageData {
           pictureView.image = UIImage(data: newImageData)
        }
    }
    
    func setUpConstraints(){
    
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(pictureView.snp.right).offset(20)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(50)
            make.left.equalTo(pictureView.snp.right).offset(20)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(80)
            make.left.equalTo(pictureView.snp.right).offset(20)
        }
        
        pictureView.snp.makeConstraints { make in
            make.top.bottom.left.equalTo(contentView).inset(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 0))
            make.width.equalTo(contentView.frame.width * 0.4)
        }
    }
    
    func gradientBackgroundColor() {
         let colors = cellRandomBackgroundColors()
         self.contentView.setGradientBackgroundColor(colorOne: colors[0], colorTow: colors[1])
     }
}

