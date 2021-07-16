//
//  BaseResponse.swift
//  INews
//
//  Created by no one on 15/07/2021.
//

import Foundation


class BaseResponse<T: Codable>: Codable {
    var status: String?
    var data: T?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "articles"
    }
}
