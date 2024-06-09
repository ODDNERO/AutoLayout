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
