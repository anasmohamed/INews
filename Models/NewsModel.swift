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
    var image: String?
    var source : Source?
    var content : String?
    var date : String?
    var description : String?
    var urlSource : String?
    enum CodingKeys: String, CodingKey {
        case authorName = "author"
        case title = "title"
        case image = "urlToImage"
        case source = "source"
        case content = "content"
        case date = "publishedAt"
        case description = "description"
        case urlSource = "url"
    }
}

struct Source: Codable {
    var name : String?
    
    enum CodingKeys : String, CodingKey {
        case name = "name"
    }
}
