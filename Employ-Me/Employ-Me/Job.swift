//
//  Job.swift
//  Employ-Me
//
//  Created by Morgan Belous on 4/1/20.
//  Copyright © 2020 Morgan Belous. All rights reserved.
//

import Foundation
import UIKit

class Job: Codable {
    var id: Int
    var title: String
    var name: String
    var email: String
    var price: String
    var bio: String
    var imageName: String
    
    init(id: Int, title: String, name: String, email: String, price: String, bio: String, imageName: String) {
        self.id = id
        self.title = title
        self.name = name
        self.email = email
        self.price = price
        self.bio = bio
        self.imageName = imageName
    }
    
}

