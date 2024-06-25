//
//  SimilarCollectionViewCell.swift
//  NETFLIX
//
//  Created by NERO on 6/25/24.
//

import UIKit
import SnapKit
import Kingfisher

class HomeCollectionViewCell: UICollectionViewCell {
    let movieImageView = Resource.movieImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeCollectionViewCell {
    func configureLayout() {
        contentView.addSubview(movieImageView)
        movieImageView.snp.makeConstraints {
            $0.edges.equalTo(contentView.safeAreaLayoutGuide)
        }
    }
    
    func setMovieImage(url: String) {
        let url = URL(string: url)
        movieImageView.kf.setImage(with: url)
    }
}
