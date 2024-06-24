//
//  SimilarCollectionView.swift
//  NETFLIX
//
//  Created by NERO on 6/25/24.
//

import UIKit

class SimilarCollectionView: UICollectionView {
    var similarList = [Result]() {
        didSet {
            self.reloadData()
        }
    }
    
    init(layout: () -> UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: layout())
        self.backgroundColor = .clear
        self.delegate = self
        self.dataSource = self
        self.register(SimilarCollectionViewCell.self, forCellWithReuseIdentifier: SimilarCollectionViewCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SimilarCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return similarList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SimilarCollectionViewCell.identifier, for: indexPath) as! SimilarCollectionViewCell
        let url = TMDB.imageURL + similarList[indexPath.row].poster_path!
        cell.update(url: url)
        return cell
    }
}
