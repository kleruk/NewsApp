//
//  ListNewsCollectionCell.swift
//  NewsApp
//
//  Created by Roman Gluhov on 15.05.2023.
//

import Foundation
import UIKit

class ListNewsCollectionCell : UICollectionViewCell {
    
    static let nibIdentifier = "ListNewsCollectionCell"
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImageView.layer.cornerRadius = 8.0
    }

    func setNewsData(newsData: NewsItem) {
        
        if let imageURL = newsData.titleImageUrl {
            Task {
                do {
                    iconImageView.image = try await UIImage.downloadImage(from: imageURL)
                }
                catch {
                    print(error.localizedDescription)
                }
            }
        }
        titleLabel.text = newsData.title ?? ""
        
    }
    
}
