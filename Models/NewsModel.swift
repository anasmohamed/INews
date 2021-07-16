//
//  NewsModel.swift
//  INews
//
//  Created by no one on 15/07/2021.
//

import Foundation

class NewsModel: Codable {
    var authorName: String?
    var title: String?
    
    enum CodingKeys: String, CodingKey {
        case authorName = "author"
        case title = "title"
    }
}
