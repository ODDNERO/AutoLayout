//
//  BoxOfficeViewController.swift
//  NETFLIX
//
//  Created by NERO on 6/5/24.
//

import UIKit
import SnapKit
import Alamofire

class BoxOfficeViewController: UIViewController {
    let dateTextField = UITextField()
    let dateSearchButton = UIButton()
    let searchStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    let movieTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestBoxOfficeData()
        
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
        [dateTextField, dateSearchButton].forEach { searchStackView.addArrangedSubview($0) }
        [searchStackView, movieTableView].forEach { view.addSubview($0) }
    }
    
    func configureData() {
        
    }
}

//MARK: - Network
extension BoxOfficeViewController {
    func requestBoxOfficeData() {
        let date = 20240601 //테스트용 임시 날짜
        
        let url = BoxOffice.url + "?" + "key=\(BoxOffice.key)" + "&" + "targetDt=\(date)"
        
        AF.request(url).responseDecodable(of: BoxOfficeDTO.self) { dataResponse in
            switch dataResponse.result {
            case .success(let boxOffice):
                print("--- success ---")
                print(boxOffice.boxOfficeResult.dailyBoxOfficeList)
            case .failure(let error):
                print("--- failure ---")
                print(error)
            }
        }
    }
}

//MARK: - Configure UI
extension BoxOfficeViewController {
    func configureLayout() {
        searchStackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(25)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(35)
            dateSearchButton.snp.makeConstraints {
                $0.trailing.equalTo(searchStackView)
                $0.size.equalTo(45)
            }
        }
        
        movieTableView.snp.makeConstraints {
            $0.top.equalTo(searchStackView).offset(30)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(30)
        }
    }
    
    func configureUI() {
        view.backgroundColor = .black
        
        [dateTextField, dateSearchButton].forEach { $0.layer.cornerRadius = 22 }
        dateTextField.layer.borderColor = UIColor.systemGray3.cgColor
        dateTextField.layer.borderWidth = 1.5
        dateTextField.tintColor = .white
        dateTextField.textColor = .white
        dateTextField.textAlignment = .center
        dateTextField.attributedPlaceholder =
        NSAttributedString(string: "날짜(YYYYMMDD)를 입력해 보세요!",
                           attributes: [.foregroundColor: UIColor.systemGray5, .font: UIFont.systemFont(ofSize: 14)])
        configureSearchButtonUI()
    }
    
    func configureSearchButtonUI() {
        dateSearchButton.setTitle("👀", for: .normal)
        dateSearchButton.backgroundColor = .netflix
        dateSearchButton.layer.borderWidth = 1.5
        dateSearchButton.layer.borderColor = UIColor(resource: .pointRed).cgColor
    }
}

//MARK: - Switching View
extension BoxOfficeViewController {
    func settingNavigation() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "🏆 MOVIE RANK"
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
    }
}
