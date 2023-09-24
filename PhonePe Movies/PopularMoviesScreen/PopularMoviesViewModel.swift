//
//  PopularMoviesViewModel.swift
//  PhonePe Movies
//
//  Created by Karthik Maharajan Skandarajah on 24/09/2023.
//

enum PopularMoviesViewState {
    case loading
    case loaded([Movie])
    case error
}

extension PopularMoviesViewState {
    
    var movies: [Movie] {
        switch self {
        case .loaded(let movies):
            return movies
        case .loading, .error:
            return []
        }
    }
    
}


final class PopularMoviesViewModel {
    
    // MARK: - Dependencies
    
    private let apiManager: APIManaging
    
    // MARK: - Properties
    
    var didUpdateState: (() -> Void)?

    var state: PopularMoviesViewState = .loading {
        didSet {
            didUpdateState?()
        }
    }
    
    // MARK: - Init
    
    init(apiManager: APIManaging) {
        self.apiManager = apiManager
    }
    
    // MARK: - Network
    
    func fetchData() {
        apiManager.execute(.fetchPopularMovies) { [weak self] result in
            switch result {
            case .success(let page):
                self?.state = .loaded(page.results)
            case .failure:
                self?.state = .error
            }
        }
    }

}
