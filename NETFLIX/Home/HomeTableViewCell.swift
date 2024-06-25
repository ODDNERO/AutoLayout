//
//  HomeTableViewCell.swift
//  NETFLIX
//
//  Created by NERO on 6/25/24.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    let homeCollectionView = HomeCollectionView {
        let layout = UICollectionViewFlowLayout()
        let sectionSpacing: CGFloat = 10
        let cellSpacing: CGFloat = 10
        let cellCount = 3.3
        let width = (UIScreen.main.bounds.width - (sectionSpacing * 1) - (cellSpacing * 3)) / cellCount
        
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: width, height: width * 1.4)
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return layout
    }
    
    lazy var movieLabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .heavy)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeTableViewCell {
    func setLabelText(index: Int) {
        let text = ["비슷한 영화", "추천 영화"]
        movieLabel.text = text[index]
    }
    
    func configureLayout() {
        [movieLabel, homeCollectionView].forEach {
            contentView.addSubview($0)
        }
        
        movieLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.safeAreaLayoutGuide)
            $0.horizontalEdges.equalTo(contentView.safeAreaLayoutGuide).inset(12)
            $0.height.equalTo(30)
        }
        homeCollectionView.snp.makeConstraints {
            $0.top.equalTo(movieLabel.snp.bottom).offset(3)
            $0.horizontalEdges.equalTo(contentView.safeAreaLayoutGuide)
            $0.height.equalTo(160)
        }
    }
}
