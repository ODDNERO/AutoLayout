//
//  RecommendCollectionView.swift
//  NETFLIX
//
//  Created by NERO on 6/24/24.
//

import UIKit

class RecommendCollectionView: UICollectionView {
    var recommendList = [Result]() {
        didSet {
            self.reloadData()
        }
    }
    
    init(layout: () -> UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: layout())
        self.backgroundColor = .clear
        self.delegate = self
        self.dataSource = self
        self.register(RecommendCollectionViewCell.self, forCellWithReuseIdentifier: RecommendCollectionViewCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecommendCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendCollectionViewCell.identifier, for: indexPath) as! RecommendCollectionViewCell
        let url = TMDB.imageURL + recommendList[indexPath.row].poster_path!
        cell.update(url: url)
        return cell
    }
}
