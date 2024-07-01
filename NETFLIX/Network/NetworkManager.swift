//
//  NetworkManager.swift
//  NETFLIX
//
//  Created by NERO on 6/24/24.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    private init() {
    }
    
    typealias TMDBHandler = ([TMDBList]?, String?) -> Void
    
    func trend(api: TMDBRequest, completionHandler: @escaping TMDBHandler) {
        AF.request(api.endpoint,
                   method: api.method,
                   parameters: api.parameter,
                   encoding: URLEncoding(destination: .queryString),
                   headers: api.header)
        .responseDecodable(of: TMDB.self) { response in
            switch response.result {
            case .success(let TMDB):
                completionHandler(TMDB.results, nil)
            case .failure(let error):
                print("------- trendMovie failure ------- \n", error)
                completionHandler(nil, "알맞은 리스트를 불러오지 못했어요 😞 \n저희가 선정한 리스트를 둘러보세요!")
            }
        }
    }
    
    func youTube(api: TMDBRequest, completionHandler: @escaping TMDBHandler) {
        AF.request(api.endpoint,
                   method: api.method,
                   parameters: api.parameter,
                   encoding: URLEncoding(destination: .queryString),
                   headers: api.header)
        .responseDecodable(of: TMDB.self) { response in
            switch response.result {
            case .success(let TMDB):
                completionHandler(TMDB.results, nil)
            case .failure(let error):
                print("------- youTube failure ------- \n", error)
                completionHandler(nil, "연결 실패!")
            }
        }
    }
}
