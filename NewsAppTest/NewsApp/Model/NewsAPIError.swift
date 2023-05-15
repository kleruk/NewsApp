//
//  NewsAPIError.swift
//  NewsApp
//
//  Created by Roman Gluhov on 14.05.2023.
//

import Foundation

enum NewsAPIError: Error {
    
    // добавить больше статусов с ошибками
    case internet (internalError: Error)
    case other(internalError: Error)
    
    case unknown
    
    var code: Int {
        switch self {
        case .internet(let error):
            return (error._code == NSURLErrorNotConnectedToInternet) ? -1 : -2
        case .other(_):
            return -11
        case .unknown:
            return -12
        }
    }
    
    var errorDescription: String? {
        switch self {
        case .internet(_):
            return "Check your internet connection or try later"
        
        default:
            break
        }
        return "Try again or come back later"
    }
}
