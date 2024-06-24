//
//  PointButton.swift
//  NETFLIX
//
//  Created by NERO on 6/24/24.
//

import UIKit

final class PointButton: UIButton {
    init(title: String, image: UIImage, foreColor: UIColor, backColor: UIColor) {
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        setTitleColor(foreColor, for: .normal)
        setImage(image, for: .normal)
        tintColor = foreColor
        backgroundColor = backColor

        imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        layer.cornerRadius = 4
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
