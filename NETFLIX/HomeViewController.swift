//
//  HomeViewController.swift
//  NETFLIX
//
//  Created by NERO on 6/4/24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    let homeView = UIView()
    let userNameLabel = {
        let label = UILabel()
        label.text = "시네필 님"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        return label
    }()
    
    let homeMovieImageView = {
        let imageView = UIImageView()
        imageView.image = .init(named: "겨울왕국")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 6
        return imageView
    }()
    let movieBackgroundImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let movieKeywordLabel = {
        let label = UILabel()
        label.text = "애니메이션 · 모험 · 뮤지컬 · 가족 · 판타지"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    let playMovieButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.setTitle("재생", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        button.tintColor = .black
        button.imageEdgeInsets.right = 15
        button.backgroundColor = .white
        button.layer.cornerRadius = 4
        return button
    }()
    let wishMovieListButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.setTitle("내가 찜한 리스트", for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        button.tintColor = .white
        button.imageEdgeInsets.left = 5
        button.imageEdgeInsets.right = 15
        button.backgroundColor = .deepDarkGray
        button.layer.cornerRadius = 4
        return button
    }()

    let todayContentsLabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    let firstTrendMovieImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    let secondTrendMovieImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    let thirdTrendMovieImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 4
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        configureHierarchy()
        configureLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        settingNavigation()
    }
}

//MARK: - Configure
extension HomeViewController {
    func configureHierarchy() {
        [homeView, userNameLabel, homeMovieImageView, movieBackgroundImageView, movieKeywordLabel, playMovieButton, wishMovieListButton, todayContentsLabel, firstTrendMovieImageView, secondTrendMovieImageView, thirdTrendMovieImageView].forEach {
            view.addSubview($0)
        }
    }
    
    func configureLayout() {

    }
}

//MARK: - Switching View
extension HomeViewController {
    func settingNavigation() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = .white
        
        let signUpButton = UIBarButtonItem(title: "로그인", style: .plain, target: self, action: #selector(signUpButtonClicked))
        navigationItem.rightBarButtonItem = signUpButton
    }
    
    @objc func signUpButtonClicked() {
        navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
}
