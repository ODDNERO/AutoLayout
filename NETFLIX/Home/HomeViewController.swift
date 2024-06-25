//
//  HomeViewController.swift
//  NETFLIX
//
//  Created by NERO on 6/4/24.
//

import UIKit
import SnapKit
import Kingfisher

class HomeViewController: UIViewController {
//    let homeView = UIView()
//    let userNameLabel = {
//        let label = UILabel()
//        label.text = "시네필 님"
//        label.textColor = .white
//        label.textAlignment = .center
//        label.font = .systemFont(ofSize: 20, weight: .heavy)
//        return label
//    }()
//    
//    let homeMovieImageView = {
//        let imageView = UIImageView()
//        imageView.image = .init(named: "겨울왕국")
//        imageView.contentMode = .scaleAspectFill
//        imageView.layer.cornerRadius = 6
//        return imageView
//    }()
//    let movieBackgroundImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleToFill
//        return imageView
//    }()
//    
//    let movieKeywordLabel = {
//        let label = UILabel()
//        label.text = "애니메이션 · 모험 · 뮤지컬 · 가족 · 판타지"
//        label.textColor = .white
//        label.textAlignment = .center
//        return label
//    }()
    
    let playMovieButton = PointButton(title: "재생", image: UIImage(systemName: "play.fill")!, foreColor: .black, backColor: .white)
    let wishMovieListButton = PointButton(title: "내가 찜한 리스트", image: UIImage(systemName: "plus")!, foreColor: .white, backColor: .deepDarkGray)
    let buttonStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let todayTrendMovieLabel = {
        let label = UILabel()
        label.text = "🔥 오늘의 인기 영화 TOP3 🔥"
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .heavy)
        return label
    }()
    let firstTrendMovieImageView = Resource.movieImageView()
    let secondTrendMovieImageView = Resource.movieImageView()
    let thirdTrendMovieImageView = Resource.movieImageView()
    let movieImageStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        return stackView
    }()
    var trendMovieList: [Result] = []
    
    lazy var similarMovieLabel = {
        let label = UILabel()
        label.text = "비슷한 영화"
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .heavy)
        return label
    }()
    lazy var similarCollectionView = SimilarCollectionView {
        MovieCollectionViewFlowLayout()
    }
    
    lazy var recommendMovieLabel = {
        let label = UILabel()
        label.text = "추천 영화"
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .heavy)
        return label
    }()
    lazy var recommendCollectionView = RecommendCollectionView(layout: MovieCollectionViewFlowLayout)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureSetting()
        settingTop3MovieImage()
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        settingNavigation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
}

//MARK: - Network
extension HomeViewController {
    func settingTop3MovieImage() {
        let imageViews = [firstTrendMovieImageView, secondTrendMovieImageView, thirdTrendMovieImageView]
        for index in 0...2 {
            TrendManager.requestMovieData { movie in
                let movieImageSource = movie.results[index].poster_path
                let url = URL(string: "\(TMDB.imageURL)\(movieImageSource!)")
                imageViews[index].kf.setImage(with: url)
            }
        }
    }
    
    func configureSetting() {
        view.backgroundColor = .black
        firstTrendMovieImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(firstMovieClicked)))
        secondTrendMovieImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(secondMovieClicked)))
        thirdTrendMovieImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(thirdMovieClicked)))
    }
    
    @objc func firstMovieClicked() {
        TrendManager.requestMovieData { movie in
            let movieID = movie.results[0].id
            MovieManager(movieID: movieID, requestCategory: MovieRequest.recommendations).requestMovieData { movie in
                self.recommendCollectionView.recommendList = movie.results
            }
            MovieManager(movieID: movieID, requestCategory: MovieRequest.similar).requestMovieData { movie in
                self.similarCollectionView.similarList = movie.results
            }
        }
        self.configure()
    }
    @objc func secondMovieClicked() {
        TrendManager.requestMovieData { movie in
            let movieID = movie.results[1].id
            MovieManager(movieID: movieID, requestCategory: MovieRequest.recommendations).requestMovieData { movie in
                self.recommendCollectionView.recommendList = movie.results
            }
            MovieManager(movieID: movieID, requestCategory: MovieRequest.similar).requestMovieData { movie in
                self.similarCollectionView.similarList = movie.results
            }
        }
        self.configure()
    }
    @objc func thirdMovieClicked() {
        TrendManager.requestMovieData { movie in
            let movieID = movie.results[2].id
            MovieManager(movieID: movieID, requestCategory: MovieRequest.recommendations).requestMovieData { movie in
                self.recommendCollectionView.recommendList = movie.results
            }
            MovieManager(movieID: movieID, requestCategory: MovieRequest.similar).requestMovieData { movie in
                self.similarCollectionView.similarList = movie.results
            }
        }
        self.configure()
    }
}

//MARK: - UI
extension HomeViewController {
    func configureHierarchy() {
        [playMovieButton, wishMovieListButton].forEach {
            buttonStackView.addArrangedSubview($0)
        }
        [firstTrendMovieImageView, secondTrendMovieImageView, thirdTrendMovieImageView].forEach {
            movieImageStackView.addArrangedSubview($0)
        }
        
        //        [todayTrendMovieLabel, movieImageStackView, buttonStackView, similarMovieLabel, similarCollectionView, recommendMovieLabel, recommendCollectionView].forEach {
        //            view.addSubview($0)
        //        }
        
        [todayTrendMovieLabel, movieImageStackView, buttonStackView].forEach {
            self.view.addSubview($0)
        }
//        [homeView, userNameLabel, homeMovieImageView, movieBackgroundImageView, movieKeywordLabel].forEach {
//            view.addSubview($0)
//        }
    }
    
    func configure() {
        [similarMovieLabel, similarCollectionView, recommendMovieLabel, recommendCollectionView].forEach {
            view.addSubview($0)
        }
        
        similarMovieLabel.snp.makeConstraints {
            $0.top.equalTo(buttonStackView.snp.bottom).offset(18)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(12)
            $0.height.equalTo(30)
        }
        similarCollectionView.snp.makeConstraints {
            $0.top.equalTo(similarMovieLabel.snp.bottom).offset(3)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(160)
        }
        
        recommendMovieLabel.snp.makeConstraints {
            $0.top.equalTo(similarCollectionView.snp.bottom).offset(10)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(12)
            $0.height.equalTo(30)
        }
        recommendCollectionView.snp.makeConstraints {
            $0.top.equalTo(recommendMovieLabel.snp.bottom).offset(3)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(160)
        }
    }
    
    func MovieCollectionViewFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let sectionSpacing: CGFloat = 10
        let cellSpacing: CGFloat = 10
        let cellCount = 3.3
        let width = (UIScreen.main.bounds.width - (sectionSpacing * 1) - (cellSpacing * 3)) / cellCount
        
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: width, height: width * 1.4)
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return layout
    }
    
    func configureLayout() {
        todayTrendMovieLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(12)
            $0.height.equalTo(30)
        }
        
        movieImageStackView.snp.makeConstraints {
            $0.top.equalTo(todayTrendMovieLabel.snp.bottom).offset(10)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(12)
            $0.height.equalTo(160)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(movieImageStackView.snp.bottom).offset(20)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
            $0.height.equalTo(38)
        }
        
//        similarMovieLabel.snp.makeConstraints {
//            $0.top.equalTo(buttonStackView.snp.bottom).offset(18)
//            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(12)
//            $0.height.equalTo(30)
//        }
//        similarCollectionView.snp.makeConstraints {
//            $0.top.equalTo(similarMovieLabel.snp.bottom).offset(3)
//            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
//            $0.height.equalTo(160)
//        }
//        
//        recommendMovieLabel.snp.makeConstraints {
//            $0.top.equalTo(similarCollectionView.snp.bottom).offset(10)
//            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(12)
//            $0.height.equalTo(30)
//        }
//        recommendCollectionView.snp.makeConstraints {
//            $0.top.equalTo(recommendMovieLabel.snp.bottom).offset(3)
//            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
//            $0.height.equalTo(160)
//        }
    }
}

//MARK: - Switching View
extension HomeViewController {
    func settingNavigation() {
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "시네필 님"
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 18, weight: .heavy)
        ]
        
        let signUpButton = UIBarButtonItem(title: "로그인", style: .plain, target: self, action: #selector(signUpButtonClicked))
        navigationItem.rightBarButtonItem = signUpButton
    }
    
    @objc func signUpButtonClicked() {
        navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
}
