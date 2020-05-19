//
//  NetworkManager.swift
//  Employ-Me
//
//  Created by Morgan Belous on 5/18/20.
//  Copyright © 2020 Morgan Belous. All rights reserved.
//

import Foundation
import Alamofire

let endpoint = "https://mindylou.github.io/classes.json"

class NetworkManager {
   
    
    static func getCourses() {
        Alamofire.request(endpoint, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
    
    
}
