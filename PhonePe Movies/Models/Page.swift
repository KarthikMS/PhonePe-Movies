//
//  Page.swift
//  PhonePe Movies
//
//  Created by Karthik Maharajan Skandarajah on 24/09/2023.
//

struct Page<T: Decodable>: Decodable {
    
    let pageNumber: Int
    let totalResults: Int
    let totalPages: Int
    let results: [T]
    
    enum CodingKeys: String, CodingKey {
        case pageNumber = "page"
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
    
}
