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
    
    var top3MovieIDList = [0, 0, 0]
    var movieID = 0 {
        didSet {
            self.fetchMoviePostgerImages()
        }
    }
    
    var trendMovieList = [[TMDBList()], [TMDBList()]]
    lazy var homeTableView = {
        let tableView =  UITableView()
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureLayout()
        configureSetting()
        settingTop3Movie()
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        settingNavigation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
}

//MARK: - TableView
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trendMovieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as! HomeTableViewCell
        cell.setLabelText(index: indexPath.row)
        cell.homeCollectionView.delegate = self
        cell.homeCollectionView.dataSource = self
        cell.homeCollectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        cell.homeCollectionView.tag = indexPath.row
        cell.homeCollectionView.reloadData()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

//MARK: - CollectionView
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        for num in 0...collectionView.tag {
            if num == collectionView.tag {
                return trendMovieList[num].count
            }
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
        let movieImageSource = trendMovieList[collectionView.tag][indexPath.item].poster_path
        cell.setMovieImage(url: "\(TMDBAPI.imageURL)\(movieImageSource)")
        return cell
    }
}

//MARK: - Network
extension HomeViewController {
    func settingTop3Movie() {
        let imageViews = [firstTrendMovieImageView, secondTrendMovieImageView, thirdTrendMovieImageView]
        for index in 0..<imageViews.count {
            NetworkManager.shared.trend(api: .trendMovie, completionHandler: { movieList, errorText in
                if let errorText {
                    var dummyList = Dummy.shared.trend.shuffled()
                    let imageSource = dummyList[index].poster_path
                    let url = URL(string: "\(TMDBAPI.imageURL)\(imageSource)")
                    self.todayTrendMovieLabel.text = "👀 짱구 극장판 👀"
                    imageViews[index].kf.setImage(with: url)
                    self.top3MovieIDList[index] = dummyList[index].id
                } else {
                    guard let movieList else { return }
                    let movieImageSource = movieList[index].poster_path
                    let url = URL(string: "\(TMDBAPI.imageURL)\(movieImageSource)")
                    self.todayTrendMovieLabel.text = "🔥 오늘의 인기 영화 TOP3 🔥"
                    imageViews[index].kf.setImage(with: url)
                    self.top3MovieIDList[index] = movieList[index].id
                }
            })
        }
    }
    
    func configureSetting() {
        view.backgroundColor = .black
        firstTrendMovieImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(firstMovieClicked)))
        secondTrendMovieImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(secondMovieClicked)))
        thirdTrendMovieImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(thirdMovieClicked)))
    }
    
    @objc func firstMovieClicked() {
        showTableView()
        self.movieID = self.top3MovieIDList[0]
    }
    @objc func secondMovieClicked() {
        showTableView()
        self.movieID = self.top3MovieIDList[1]
    }
    @objc func thirdMovieClicked() {
        showTableView()
        self.movieID = self.top3MovieIDList[2]
    }
    
    func fetchMoviePostgerImages() {
        let group = DispatchGroup()
        group.enter()
        DispatchQueue.global().async(group: group) {
            NetworkManager.shared.trend(api: .similar(ID: self.movieID)) { movieList, errorText in
                if let errorText {
                    let dummyList = Dummy.shared.similar.shuffled()
                    self.trendMovieList[0] = dummyList
                } else {
                    guard let movieList else { return }
                    self.trendMovieList[0] = movieList
                }
                group.leave()
            }
        }
        group.enter()
        DispatchQueue.global().async(group: group) {
            NetworkManager.shared.trend(api: .recommendations(ID: self.movieID)) { movieList, errorText in
                if let errorText {
                    let dummyList = Dummy.shared.recommendations.shuffled()
                    self.trendMovieList[1] = dummyList
                } else {
                    guard let movieList else { return }
                    self.trendMovieList[1] = movieList
                }
                group.leave()
            }
        }
        group.notify(queue: .main) {
            self.homeTableView.reloadData()
        }
    }
}

//MARK: - UI
extension HomeViewController {
    func showTableView() {
        view.addSubview(homeTableView)
        homeTableView.snp.makeConstraints {
            $0.top.equalTo(buttonStackView.snp.bottom).offset(18)
            $0.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureHierarchy() {
        [playMovieButton, wishMovieListButton].forEach {
            buttonStackView.addArrangedSubview($0)
        }
        [firstTrendMovieImageView, secondTrendMovieImageView, thirdTrendMovieImageView].forEach {
            movieImageStackView.addArrangedSubview($0)
        }
        
        [todayTrendMovieLabel, movieImageStackView, buttonStackView].forEach {
            self.view.addSubview($0)
        }

//        [homeView, userNameLabel, homeMovieImageView, movieBackgroundImageView, movieKeywordLabel].forEach {
//            view.addSubview($0)
//        }
    }

    func configureLayout() {
        todayTrendMovieLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
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
