//
//  NetworkManager.swift
//  Employ-Me
//
//  Created by Morgan Belous on 5/18/20.
//  Copyright © 2020 Morgan Belous. All rights reserved.
//

import Foundation
import Alamofire

struct APIResponse<T: Codable>: Codable {
    let success: Bool
    let data: T
}

let endpoint = "https://employme-app.herokuapp.com/api/jobs/"

class NetworkManager {
   
    static func getJobs(completion: @escaping (([Job]) -> Void) ) {
        Alamofire.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let decoder = JSONDecoder()
                
                if let jobsData = try? decoder.decode(APIResponse<[Job]>.self, from: data){
                    let jobs = jobsData.data
                    completion(jobs)

                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func createJob (title: String, name: String, email: String, price: String, bio: String, completion: @escaping ((Job) -> Void)     ) {
        let parameters: [String: Any] = [
            "title": title,
            "name": name,
            "email": email,
            "price": price,
            "bio": bio
        ]

        Alamofire.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate().responseData {response in
            switch response.result {
            case .success(let data):
                let decoder = JSONDecoder()
                if let jobData = try? decoder.decode(APIResponse<Job>.self, from: data) {
                    let job = jobData.data
                    completion(job)
                }
            case .failure(let error):
                print(error.localizedDescription)
                 
            }
        }   
    }
  
}
