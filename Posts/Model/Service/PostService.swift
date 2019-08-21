//
//  PostService.swift
//  Posts
//
//  Created by iOS Dev on 8/20/19.
//  Copyright © 2019 iOS Dev. All rights reserved.
//

import Foundation
import Alamofire

class PostService {
    
    static func getPosts(completionHandler: @escaping ([Post]?, Error?) -> Void) {
        let url = "https://jsonplaceholder.typicode.com/posts?userId=1"
        Alamofire.request(url, method: HTTPMethod.get, encoding: JSONEncoding.default).responseJSON(completionHandler: { response in
            
            if let data = response.result.value {
                
                let jsonResponse = data as! NSArray
                print(jsonResponse)
                let dictionaryItems = jsonResponse as? [[String: Any]]
                
                guard let arrayItems = dictionaryItems else {
                    completionHandler(nil,BackendError.internalError(reason: "Parsing error"))
                    return
                }
                
                let listPosts = arrayItems.map({ (dic) -> Post in
                    return Post(JSON: dic)!
                })
                
                //let size = jsonResponse["size"] as? Int
                completionHandler(listPosts, nil)
                
            } else {
                completionHandler(nil, BackendError.technicalProblem)
                
            }
        }
        )
    }
}

enum BackendError: Error {
    case parameters(reason: String)
    case connection
    case technicalProblem
    case timeOut
    case internalError(reason: String)
    case objectSerialization(reason: String)
}
