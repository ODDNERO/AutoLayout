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
        imageView.layer.cornerRadius = 4
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
}
