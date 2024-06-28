//
//  ldentifierProtocol.swift
//  NETFLIX
//
//  Created by NERO on 6/24/24.
//

import UIKit

protocol ldentifierProtocol {
    static var identifier: String { get }
}

extension UITableViewCell: ldentifierProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: ldentifierProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}
