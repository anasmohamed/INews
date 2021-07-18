//
//  NewsNetworking.swift
//  INews
//
//  Created by no one on 15/07/2021.
//

import Foundation
import Alamofire

enum NewsNetworking {
    case getNews(page:Int)
}

extension NewsNetworking: TargetType {
    var baseURL: String {
        switch self {
        case .getNews:
            return "https://newsapi.org/v2/everything?q=Apple&from=2021-07-12&sortBy=publishedAt"
        }
    }
    
    var path: String {
        switch self {
        case .getNews(let page):
            print(page)
            return "&apiKey=b173854d2bc74779b744e6f05eeeb60d&page=\(page)"
     
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getNews:
            return .get
     
        }
    }
    
    var task: Task {
        switch self {
        case .getNews:
            return .requestPlain
       
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
}
