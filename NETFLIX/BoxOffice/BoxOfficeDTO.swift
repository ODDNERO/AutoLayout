//
//  BoxOfficeDTO.swift
//  NETFLIX
//
//  Created by NERO on 6/7/24.
//

import Foundation

// MARK: - BoxOfficeDTO
struct BoxOfficeDTO: Decodable {
    let boxOfficeResult: BoxOfficeResult
}

// MARK: - BoxOfficeResult
struct BoxOfficeResult: Decodable {
    let boxofficeType, showRange: String
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}

// MARK: - DailyBoxOfficeList
struct DailyBoxOfficeList: Decodable {
    let rankNum, rank, rankIntensity: String
    let rankOldAndNew: RankOldAndNew
    let movieCD, movieName, openDate, salesAmount: String
    let salesShare, salesIntensity, salesChange, salesAccumulated: String
    let audienceCount, audienceIntensity, audienceChange, audienceAccumulated: String
    let screenCount, showCount: String

    enum CodingKeys: String, CodingKey {
        case rankNum = "rnum"
        case rank, rankOldAndNew
        case rankIntensity = "rankInten"
        case movieCD = "movieCd"
        case movieName = "movieNm"
        case openDate = "openDt"
        case salesAmount = "salesAmt"
        case salesShare, salesChange
        case salesIntensity = "salesInten"
        case salesAccumulated = "salesAcc"
        case audienceCount = "audiCnt"
        case audienceIntensity = "audiInten"
        case audienceChange = "audiChange"
        case audienceAccumulated = "audiAcc"
        case screenCount = "scrnCnt"
        case showCount = "showCnt"
    }
}

enum RankOldAndNew: String, Decodable {
    case new = "NEW"
    case old = "OLD"
}
