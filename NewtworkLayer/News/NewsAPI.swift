//
//  NewsAPI.swift
//  INews
//
//  Created by no one on 15/07/2021.
//

import Foundation

protocol NewsAPIProtocol {
    func getNewsWith(page:Int,completion: @escaping (Result<BaseResponse<[NewsModel]>?, NSError>) -> Void)
}


class NewsAPI: BaseAPI<NewsNetworking>, NewsAPIProtocol {
        
    func getNewsWith(page:Int,completion: @escaping (Result<BaseResponse<[NewsModel]>?, NSError>) -> Void) {
        self.fetchData(target: .getNews(page: page) , responseClass: BaseResponse<[NewsModel]>.self) { (result) in
            completion(result)
        }
    }
}
