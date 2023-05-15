//
//  ListNewsViewController.swift
//  NewsApp
//
//  Created by Roman Gluhov on 12.05.2023.
//

import UIKit

class ListNewsViewController: UIViewController {

    @IBOutlet var collectionView : UICollectionView!
    
    private var newsViewModel = NewsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        newsViewModel.newsLoadComplition = { [weak self] (_, success) in
            if success {
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            } else {
                
            }
        }
    }

    private func setupUI() {
//        collectionView.collectionViewLayout 
        collectionView.register(UINib(nibName: ListNewsCollectionCell.nibIdentifier, bundle: nil), forCellWithReuseIdentifier: ListNewsCollectionCell.nibIdentifier)
    }
}

extension ListNewsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        newsViewModel.numberOrRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListNewsCollectionCell.nibIdentifier, for: indexPath) as? ListNewsCollectionCell,
              let newsData = self.newsViewModel.getNews(index: indexPath.row) else {
            return UICollectionViewCell()
        }
        cell.setNewsData(newsData: newsData)
        return cell
    }
    
    
}
