//
//  TMDBRequest.swift
//  NETFLIX
//
//  Created by NERO on 6/26/24.
//

import Foundation
import Alamofire

enum TMDBRequest {
    case trendMovie
    case trendTV
    case similar(ID: Int)
    case recommendations(ID: Int)
    case search(text: String)
    case movieImages(ID: Int)
    
    var baseURL: String {
        return "https://api.themoviedb.org/"
    }
    var APIVersion: String {
        return "3/"
//        return "777/" //에러 테스트용
    }
    
    var endpoint: URL {
        switch self {
        case .trendMovie:
            URL(string: baseURL + APIVersion + "trending/movie/day")!
        case .trendTV:
            URL(string: baseURL + APIVersion + "trending/tv/day")!
        case .similar(let ID):
            URL(string: baseURL + APIVersion + "movie/\(ID)/similar")!
        case .recommendations(let ID):
            URL(string: baseURL + APIVersion + "movie/\(ID)/recommendations")!
        case .search:
            URL(string: baseURL + APIVersion + "search/movie")!
        case .movieImages(let ID):
            URL(string: baseURL + APIVersion + "movie/\(ID)/images")!
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var header: HTTPHeaders {
        return ["accept": "application/json", "Authorization": TMDBAPI.token]
    }
    
    var parameter: Parameters {
        switch self {
        case .trendMovie, .trendTV, .similar, .recommendations:
            return ["language": "ko-KR"]
        case .search(let query):
            return ["language": "ko-KR", "query": query]
        case .movieImages:
            return ["": ""]
        }
    }
}
