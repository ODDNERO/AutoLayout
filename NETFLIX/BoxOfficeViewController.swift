//
//  BoxOfficeViewController.swift
//  NETFLIX
//
//  Created by NERO on 6/5/24.
//

import UIKit

class BoxOfficeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureData()
        configureLayout()
        configureUI()
        
        settingNavigation()
    }
}

//MARK: - Configure
extension BoxOfficeViewController {
    func configureHierarchy() {
        
    }
    
    func configureData() {
        
    }
}

//MARK: - Configure UI
extension BoxOfficeViewController {
    func configureLayout() {
        
    }
    
    func configureUI() {
        
    }
}

//MARK: - Switching View
extension BoxOfficeViewController {
    func settingNavigation() {
        navigationController?.navigationBar.isHidden = true
    }
}
