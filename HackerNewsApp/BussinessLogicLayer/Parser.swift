//
//  Parser.swift
//  HackerNewsApp
//
//  Created by Serhii Haponov on 5/24/18.
//  Copyright © 2018 Serhii Haponov. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct Parser {
    static func parseResponse(_ result: Result<Any>) -> Result<[String: JSON]> {
        guard result.isSuccess, let value = result.value else {
            return Result.failure(result.error ?? ResponseError.dataMissed)
        }
        
        guard let dictionary = JSON(value).dictionary,
            let status = dictionary["status"]?.string else {
                return Result.failure(ResponseError.dataMissed)
        }
        
        guard status == "OK" else {
            return Result.failure(ResponseError.failed(code: -1, description: "Some error"))
        }
        
        return Result.success(dictionary)
    }
    
    static func parseNewsInfo(_ result: Result<Any>) -> Result<NewsInfo> {
        let parsedResult = self.parseResponse(result)
        guard let value = parsedResult.value else {
            let error = parsedResult.error ?? ResponseError.dataMissed
            return Result.failure(error)
        }
        guard let dayInfoJSON = value["hits"] else {
            return Result.failure(ResponseError.dataMissed)
        }
        guard let parsedItem = NewsInfo(json: dayInfoJSON) else {
            return Result.failure(ResponseError.invalidFormat(for: NewsInfo.self))
        }
        return Result.success(parsedItem)
        
        
    }
    
}
