//
//  MovieDTO.swift
//  NETFLIX
//
//  Created by NERO on 6/24/24.
//

import Foundation

//MARK: - TMDB
struct MovieDTO: Decodable {
    var results: [Result]
    let total_pages: Int
}

struct Result: Decodable {
    let id: Int
    let title: String
    let poster_path: String?
    let backdrop_path: String?
    let release_date: String?
    let vote_average: Float?
    let overview: String?
}
