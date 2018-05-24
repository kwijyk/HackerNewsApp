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
    let createdAt: Date
}

extension NewsInfo {
    init?(json: JSON) {
        guard let title = json["title"].string,
            let createdAt = json["created_at"].string?.toDate(format: .fullDate) else {
                return nil
        }
        self.title = title
        self.createdAt = createdAt
    }
}
