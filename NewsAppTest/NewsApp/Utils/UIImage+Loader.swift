//
//  UIImage+Loader.swift
//  NewsApp
//
//  Created by Roman Gluhov on 15.05.2023.
//

import Foundation
import UIKit

extension UIImage {
    static func downloadImage(from url: URL) async throws -> UIImage? {
        let (data, _) = try await URLSession.shared.data(from: url)
        return UIImage(data: data)
    }
}
