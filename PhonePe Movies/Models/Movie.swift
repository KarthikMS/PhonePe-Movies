//
//  Movie.swift
//  PhonePe Movies
//
//  Created by Karthik Maharajan Skandarajah on 24/09/2023.
//

struct Movie: Decodable {
    
    let id: Int
    let title: String
    let posterPath: String?
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
    }
    
}
