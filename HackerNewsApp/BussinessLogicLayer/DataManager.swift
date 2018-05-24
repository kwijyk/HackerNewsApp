//
//  DataManager.swift
//  HackerNewsApp
//
//  Created by Serhii Haponov on 5/24/18.
//  Copyright © 2018 Serhii Haponov. All rights reserved.
//

import Foundation

final class DataManager {
    static let instance = DataManager()
    private init() { }
    
    func fentchNewsPosts(by tags: String = "story", page: Int, completionHandler: @escaping ([NewsInfo], Error?) -> Void) {
        let endpoint = NewsEndpoint.searchByDate(tags: tags, page: page)
        NetworkService().request(endpoint: endpoint) { networkResponse in
            let parsedResponse = Parser.parseNewsInfo(networkResponse)
            DispatchQueue.main.async {
                completionHandler(parsedResponse.value!, parsedResponse.error)
            }
        }
    }
}
