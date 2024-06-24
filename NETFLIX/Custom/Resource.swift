//
//  Resource.swift
//  NETFLIX
//
//  Created by NERO on 6/24/24.
//

import UIKit

enum Resource {
    static func movieImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        return imageView
    }
}
