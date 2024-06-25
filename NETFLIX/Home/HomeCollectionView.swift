//
//  SimilarCollectionView.swift
//  NETFLIX
//
//  Created by NERO on 6/25/24.
//

import UIKit

class HomeCollectionView: UICollectionView {
    init(layout: () -> UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: layout())
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
