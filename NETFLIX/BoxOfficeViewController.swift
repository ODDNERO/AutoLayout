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
        
    }
    
    func configureUI() {
        view.backgroundColor = .black
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
