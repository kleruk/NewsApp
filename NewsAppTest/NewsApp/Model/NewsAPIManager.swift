//
//  NewsDataSource.swift
//  NewsApp
//
//  Created by Roman Gluhov on 12.05.2023.
//

import Foundation

class NewsAPIManager {
    
    // Вынести в константы
    private let baseUrl = URL(string: "https://webapi.autodoc.ru/api/news/1/15")!
    
    private let urlSession : URLSession
    
    init() {
        let urlconfig = URLSessionConfiguration.default
        urlconfig.httpCookieStorage = nil
        urlSession = URLSession(configuration: urlconfig)
    }
    
    public static let shared = NewsAPIManager()
    
    func updateNews() async throws -> [NewsItem] {
        
        struct Output: Decodable {
            let news : [NewsItem]?
            let totalCount: Int?
        }
        
        var request = URLRequest(url: baseUrl)
        request.httpMethod = "GET"
        
        let (data, response) = try await urlSession.data(for: request)
        print(response)
        let output = try JSONDecoder().decode(Output.self, from: data)
        return output.news ?? []
    }
    
}
