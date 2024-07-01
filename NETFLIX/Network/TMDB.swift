//
//  TMDB.swift
//  NETFLIX
//
//  Created by NERO on 6/24/24.
//

import Foundation

//MARK: - TMDB
struct TMDB: Decodable {
    var results: [TMDBList]
    let total_pages: Int
}

struct TMDBList: Decodable {
    let id: Int
    let title: String
    let poster_path: String
    let backdrop_path: String?
    let release_date: String
    let vote_average: Float
    let overview: String
    
    init(id: Int = 0, title: String = "", poster_path: String = "", backdrop_path: String? = nil, release_date: String = "", vote_average: Float = 0, overview: String = "") {
        self.id = id
        self.title = title
        self.poster_path = poster_path
        self.backdrop_path = backdrop_path
        self.release_date = release_date
        self.vote_average = vote_average
        self.overview = overview
    }
}

struct TMDBVideo: Decodable {
    let id: Int
    var results: [TMDBVideoResult]
}

struct TMDBVideoResult: Decodable {
    let key: String
}
