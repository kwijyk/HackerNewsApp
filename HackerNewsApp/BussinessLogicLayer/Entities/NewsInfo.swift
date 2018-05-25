//
//  NewsInfo.swift
//  HackerNewsApp
//
//  Created by Serhii Haponov on 5/24/18.
//  Copyright © 2018 Serhii Haponov. All rights reserved.
//

import Foundation
import SwiftyJSON

struct NewsInfo {
    let title: String
    let createdAt: String
}

extension NewsInfo {
    init?(json: JSON) {
//        guard let title = json["story_title"].string,
//            let createdAt = json["created_at"].string?.toDate(format: .fullDate) else {
//                return nil
//        }
        
        guard let createdAt = json["created_at"].string else {
                            return nil
                    }
        self.title = json["title"].stringValue
        self.createdAt = createdAt
    }
}
