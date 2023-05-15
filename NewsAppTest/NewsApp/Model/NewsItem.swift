//
//  NewsItem.swift
//  NewsApp
//
//  Created by Roman Gluhov on 12.05.2023.
//

import Foundation

struct NewsItem : Decodable, Encodable {
    let id: Int
    
    let title: String?
    let description: String?
    let publishedDate: String?
    let url: String?
    let fullUrl: URL?
    let titleImageUrl: URL?
    let categoryType: String?
    
    
}
