//
//  HomeViewController.swift
//  AutoLayout
//
//  Created by NERO on 6/4/24.
//

import UIKit

class HomeViewController: UIViewController {
    let homeView = UIView()
    let userNameLabel = UILabel()

    let homeMovieImage = UIImageView()
    let homeMovieBackgroundImage = UIImageView()
    let movieKeywordLabel = UILabel()
    let playMovieButton = UIButton()
    let wishMovieListButton = UIButton()

    let todayContentsLabel = UILabel()
    let firstTodaysMovieImage = UIImageView()
    let secondTodaysMovieImage = UIImageView()
    let thirdTodaysMovieImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        configureBarButtonItem()
    }
}

//MARK: - Configure
extension HomeViewController {
    func configureHierarchy() {
        
    }
    
    func configureLayout() {

    }
    
    func configureUI() {
        view.backgroundColor = .black
        
    }
}

//MARK: - Switching View
extension HomeViewController {
    func configureBarButtonItem() {
        let signUpButton = UIBarButtonItem(title: "SignUp", style: .plain, target: self, action: #selector(signUpButtonClicked))
        navigationItem.rightBarButtonItem = signUpButton
    }
    
    @objc func signUpButtonClicked() {
        navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
}
