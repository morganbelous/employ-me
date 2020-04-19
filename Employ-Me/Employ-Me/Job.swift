//
//  Job.swift
//  Employ-Me
//
//  Created by Morgan Belous on 4/1/20.
//  Copyright © 2020 Morgan Belous. All rights reserved.
//

import Foundation
import UIKit

class Job {
    var title: String
    var name: String
    var email: String
    var price: String
    var bio: String
    var picture: UIImage
    
    
    
    init(title: String, name: String, email: String, price: String, bio: String, picture: UIImage) {
        self.title = title
        self.name = name
        self.email = email
        self.price = price
        self.bio = bio
        self.picture = picture
        

    }
    
}
