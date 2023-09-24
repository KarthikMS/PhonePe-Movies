//
//  PopularMoviesViewModel.swift
//  PhonePe Movies
//
//  Created by Karthik Maharajan Skandarajah on 24/09/2023.
//

final class PopularMoviesViewModel {
    
    // MARK: - Dependencies
    
    private let apiManager: APIManaging
    
    // MARK: - Init
    
    init(apiManager: APIManaging) {
        self.apiManager = apiManager
    }
    
}
