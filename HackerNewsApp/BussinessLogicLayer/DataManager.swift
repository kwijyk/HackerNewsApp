//
//  DataManager.swift
//  HackerNewsApp
//
//  Created by Serhii Haponov on 5/24/18.
//  Copyright © 2018 Serhii Haponov. All rights reserved.
//

import Foundation
import SwiftyJSON

final class DataManager {
    static let instance = DataManager()
    private init() { }
    
    func fentchNewsPosts(by tags: String = "story", page: Int, completionHandler: @escaping ([NewsInfo]) -> Void) {
        let endpoint = NewsEndpoint.searchByDate(tags: tags, page: page)
        NetworkService().request(endpoint: endpoint) { networkResponse in

            switch networkResponse {
            case .success(let value):
                let jsonObj = JSON(value)
                guard let jsonDictionary = jsonObj.dictionary, let jsonArray = jsonDictionary["hits"]?.array else { return }
                var categoriesArray = [NewsInfo]()
                for objCategory in jsonArray {
                    guard let category = NewsInfo(json: objCategory) else { continue }
                    categoriesArray.append(category)
                }
                DispatchQueue.main.async {
                    completionHandler(categoriesArray)
                }
            case.failure(let error):
                print(error)
            }
            
//            let parsedResponse = Parser.parseNewsInfo(networkResponse)
//            DispatchQueue.main.async {
//                completionHandler(parsedResponse.value!, parsedResponse.error)
//            }
        }
    }
}
