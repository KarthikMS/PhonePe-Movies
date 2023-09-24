//
//  Request.swift
//  PhonePe Movies
//
//  Created by Karthik Maharajan Skandarajah on 24/09/2023.
//

enum Method: String {
    case get = "GET"
}

struct Request<Value> {
    
    var method: Method
    var path: String
    
    init(method: Method = .get, path: String) {
        self.method = method
        self.path = path
    }
    
}


extension Request {
    
    static var fetchPopularMovies: Request<Page<Movie>> {
        .init(path: "/movie/popular")
    }
    
}
