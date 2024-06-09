//
//  BoxOfficeTableViewCell.swift
//  NETFLIX
//
//  Created by NERO on 6/8/24.
//

import UIKit
import SnapKit

class BoxOfficeTableViewCell: UITableViewCell {
    static let identifier = "BoxOfficeTableViewCell"
    
    let rankLabel = UILabel()
    let titleLabel = UILabel()
    let openDateLabel = UILabel()
    let movieStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [rankLabel, titleLabel, openDateLabel].forEach { movieStackView.addArrangedSubview($0) }
        contentView.addSubview(movieStackView)
        
        configureLayout()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Configure UI
extension BoxOfficeTableViewCell {
    func configureLayout() {
        movieStackView.snp.makeConstraints {
            $0.centerX.equalTo(contentView)
            $0.centerY.equalTo(contentView)
            $0.leading.trailing.equalTo(contentView.safeAreaLayoutGuide).inset(8)
        }
        
        rankLabel.snp.makeConstraints {
            $0.leading.equalTo(movieStackView)
            $0.width.equalTo(35)
            $0.height.equalTo(25)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(rankLabel.snp.trailing).offset(10)
        }
        
        openDateLabel.snp.makeConstraints {
            $0.width.equalTo(80)
            $0.trailing.equalTo(movieStackView)
        }
    }
    
    func configureUI() {
        self.selectionStyle = .none
        
        rankLabel.backgroundColor = .pointRed
        rankLabel.textColor = .white
        rankLabel.textAlignment = .center
        rankLabel.layer.cornerRadius = 4
        rankLabel.layer.masksToBounds = true
        rankLabel.font = .systemFont(ofSize: 15, weight: .bold)
        
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 15, weight: .bold)
        titleLabel.numberOfLines = 0

        openDateLabel.textColor = .systemGray3
        openDateLabel.textAlignment = .right
        openDateLabel.font = .systemFont(ofSize: 13, weight: .medium)
    }
}
