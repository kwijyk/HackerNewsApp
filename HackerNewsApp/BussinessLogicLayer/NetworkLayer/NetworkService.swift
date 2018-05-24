//
//  NetworkService.swift
//  HackerNewsApp
//
//  Created by Serhii Haponov on 5/24/18.
//  Copyright © 2018 Serhii Haponov. All rights reserved.
//

import Foundation
import Alamofire

struct NetworkService {
    private static var defaultBaseURL: String {
        return "http://hn.algolia.com/api/v1/"
    }
    
    private let baseURL: String
    
    init(baseURL: String = defaultBaseURL) {
        self.baseURL = baseURL
    }
    
    /// completionHandler performed NOT in the main thread
    func request(endpoint: Endpoint, completionHandler: ((Result<Any>) -> Void)? = nil) {
        guard Reachability.isInternetAvailable else {
            completionHandler?(Result.failure(ResponseError.internetNotAvailable))
            return
        }
        
        Alamofire.request(baseURL + endpoint.path,
                          method: endpoint.method,
                          parameters: endpoint.parameters).responseJSON(queue: DispatchQueue.global()) { networkResponse in
                            completionHandler?(networkResponse.result)
                            
                            
        }
    }
}
