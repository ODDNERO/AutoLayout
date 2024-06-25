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
    
    static func requestMovieData(completionHandler: @escaping (TMDB) -> Void) {
        let url = TMDBAPI.trendURL
        let header: HTTPHeaders = ["accept": "application/json",
                                   "Authorization": TMDBAPI.token]
        let parameter: Parameters = ["language": "ko-KR"]
        
        AF.request(url, method: .get, parameters: parameter, headers: header)
            .responseDecodable(of: TMDB.self) { response in
                switch response.result {
                case .success(let movie):
                    completionHandler(movie)
                case .failure(let error):
                    print(error)
                }
            }
    }
}

enum RequestCategory{
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
    
    func requestMovieData(completionHandler: @escaping (TMDB) -> Void) {
        let url = "\(TMDBAPI.baseURL)\(movieID)\(requestCategory)"
        let header: HTTPHeaders = ["accept": "application/json",
                                   "Authorization": TMDBAPI.token]
        let parameter: Parameters = ["language": "ko-KR"]
        
       
        AF.request(url, method: .get, parameters: parameter, headers: header)
            .responseDecodable(of: TMDB.self) { response in
                switch response.result {
                case .success(let movie):
                    completionHandler(movie)
                    
                case .failure(let error):
                    print(error)
                }
            }
    }
}
