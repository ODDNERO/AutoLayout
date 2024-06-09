//
//  BoxOfficeTableViewCell.swift
//  NETFLIX
//
//  Created by NERO on 6/8/24.
//

import UIKit

class BoxOfficeTableViewCell: UITableViewCell {
    static let identifier = "BoxOfficeTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
