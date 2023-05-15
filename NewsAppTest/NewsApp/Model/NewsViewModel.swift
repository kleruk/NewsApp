//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Roman Gluhov on 12.05.2023.
//

import Foundation

class NewsViewModel {
    var items: [NewsItem]?
    var newsLoadComplition: (([NewsItem]?, Bool) -> Void)?
    
    init() {
        checkUpdate()
    }
    
    private func checkUpdate() {
        
        Task {
            do {
                let news = try await NewsAPIManager.shared.updateNews()
                items = news
                handle(response: news, success: true)
            }
            catch {
                handle(response: nil, success: false)
                print(error.localizedDescription)
            }
        }
        
        
    }
    
    private func handle(response: [NewsItem]?, success: Bool) {
        if let newsLoadComplition = self.newsLoadComplition {
            newsLoadComplition(response, success)
        }
    }

    func numberOrRows() -> Int {
        return self.items?.count ?? 0
    }

    func getNews(index: Int) -> NewsItem? {
        return self.items?[index]
    }
}
