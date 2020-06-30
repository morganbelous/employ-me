//
//  MyJobCollectionViewCell.swift
//  Employ-Me
//
//  Created by Morgan Belous on 6/30/20.
//  Copyright © 2020 Morgan Belous. All rights reserved.
//

import UIKit

class MyJobCollectionViewCell: UICollectionViewCell {
    
    var titleLabel: UILabel!
    
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
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textAlignment = .left
        contentView.addSubview(titleLabel)
 
        setUpConstraints()
        gradientBackgroundColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(for job: Job){
        titleLabel.text = job.title
    }
    
    func setUpConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(15)
            make.left.equalTo(contentView).offset(8)
        }
        
    }
    
    func gradientBackgroundColor() {
        let colors = cellRandomBackgroundColors()
        self.contentView.setGradientBackgroundColor(colorOne: colors[0], colorTow: colors[1])
    }
    
}
