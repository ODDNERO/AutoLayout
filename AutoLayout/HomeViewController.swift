//
//  HomeViewController.swift
//  AutoLayout
//
//  Created by NERO on 6/4/24.
//

import UIKit
import SnapKit

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
        [homeView, userNameLabel, homeMovieImage, homeMovieBackgroundImage, movieKeywordLabel, playMovieButton, wishMovieListButton, todayContentsLabel, firstTodaysMovieImage, secondTodaysMovieImage, thirdTodaysMovieImage]
            .forEach { view.addSubview($0) }
    }
    
    func configureLayout() {

    }
    
    func configureUI() {
        view.backgroundColor = .black
        
        userNameLabel.text = "시네필 님"
        userNameLabel.textColor = .white
        userNameLabel.textAlignment = .center
        userNameLabel.font = .systemFont(ofSize: 20, weight: .heavy)
        
        homeMovieImage.image = .init(named: "겨울왕국")
        homeMovieImage.contentMode = .scaleAspectFill
        homeMovieBackgroundImage.contentMode = .scaleToFill
        homeMovieImage.layer.cornerRadius = 6
        
        movieKeywordLabel.text = "애니메이션 · 모험 · 뮤지컬 · 가족 · 판타지"
        movieKeywordLabel.textColor = .white
        movieKeywordLabel.textAlignment = .center
        
        playMovieButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        playMovieButton.setTitle("재생", for: .normal)
        playMovieButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        playMovieButton.tintColor = .black
        playMovieButton.imageEdgeInsets.right = 15
        playMovieButton.backgroundColor = .white
        playMovieButton.layer.cornerRadius = 4
        
        wishMovieListButton.setImage(UIImage(systemName: "plus"), for: .normal)
        wishMovieListButton.setTitle("내가 찜한 리스트", for: .normal)
        wishMovieListButton.titleLabel?.numberOfLines = 0
        wishMovieListButton.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        wishMovieListButton.tintColor = .white
        wishMovieListButton.imageEdgeInsets.left = 5
        wishMovieListButton.imageEdgeInsets.right = 15
        wishMovieListButton.backgroundColor = .deepDarkGray
        wishMovieListButton.layer.cornerRadius = 4
        
        todayContentsLabel.textColor = .white
        todayContentsLabel.textAlignment = .left
        
        firstTodaysMovieImage.layer.cornerRadius = 4
        firstTodaysMovieImage.image = .init(named: "더퍼스트슬램덩크")
        firstTodaysMovieImage.contentMode = .scaleAspectFill
        
        secondTodaysMovieImage.layer.cornerRadius = 4
        secondTodaysMovieImage.image = .init(named: "오펜하이머")
        secondTodaysMovieImage.contentMode = .scaleAspectFill
        
        thirdTodaysMovieImage.layer.cornerRadius = 4
        thirdTodaysMovieImage.image = .init(named: "스즈메의문단속")
        thirdTodaysMovieImage.contentMode = .scaleAspectFill
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
