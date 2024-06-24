//
//  NetworkManager.swift
//  NETFLIX
//
//  Created by NERO on 6/24/24.
//

import Foundation
import Alamofire

class TrendManager {
    private init() {
    }
    
    static func requestMovieData(completionHandler: @escaping (MovieDTO) -> Void) {
        let url = TMDB.trendURL
        let header: HTTPHeaders = ["accept": "application/json",
                                   "Authorization": TMDB.token]
        let parameter: Parameters = ["language": "ko-KR"]
        
        AF.request(url, method: .get, parameters: parameter, headers: header)
            .responseDecodable(of: MovieDTO.self) { response in
                switch response.result {
                case .success(let movie):
                    completionHandler(movie)
                case .failure(let error):
                    print(error)
                }
            }
    }
}

enum MovieRequest{
    static let similar = "/similar"
    static let recommendations = "/recommendations"
}

class MovieManager {
    var movieID = 0
    var requestCategory = ""
    init(movieID: Int, requestCategory: String) {
        self.movieID = movieID
        self.requestCategory = requestCategory
    }
    
    func requestMovieData(completionHandler: @escaping (MovieDTO) -> Void) {
        let url = "\(TMDB.baseURL)\(movieID)\(requestCategory)"
        let header: HTTPHeaders = ["accept": "application/json",
                                   "Authorization": TMDB.token]
        let parameter: Parameters = ["language": "ko-KR"]
        
       
        AF.request(url, method: .get, parameters: parameter, headers: header)
            .responseDecodable(of: MovieDTO.self) { response in
                switch response.result {
                case .success(let movie):
                    completionHandler(movie)
                    
                case .failure(let error):
                    print(error)
                }
            }
    }
}
