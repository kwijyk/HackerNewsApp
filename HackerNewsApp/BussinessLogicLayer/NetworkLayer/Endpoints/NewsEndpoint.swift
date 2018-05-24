//
//  NewsEndpoint.swift
//  HackerNewsApp
//
//  Created by Serhii Haponov on 5/24/18.
//  Copyright © 2018 Serhii Haponov. All rights reserved.
//

import Foundation
import Alamofire

enum NewsEndpoint {
    case searchByDate(tags: String, page: Int)
    
}

// MARK: Endpoint implementation
extension NewsEndpoint: Endpoint {
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .searchByDate:
            return "search_by_date"
        }
    }
    
    var parameters: [String: Any]? {
        var params: [String: Any]?
        switch self {
        case .searchByDate(let tags, let page):
            params = ["tags": tags,
                      "page": page]
        }
        return params
    }
}
