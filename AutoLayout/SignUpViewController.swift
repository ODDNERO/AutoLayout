//
//  SignUpViewController.swift
//  AutoLayout
//
//  Created by NERO on 6/4/24.
//

import UIKit

class SignUpViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
        settingNavigation()
    }
}

//MARK: - Configure
extension SignUpViewController {
    func configureHierarchy() {
        
    }
    
    func configureLayout() {

    }
    
    func configureUI() {
        view.backgroundColor = .black
        
    }
}

//MARK: - Switching View
extension SignUpViewController {
    func settingNavigation() {
        navigationItem.hidesBackButton = true
    }
}
