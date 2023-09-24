//
//  UIImageViewExtensions.swift
//  PhonePe Movies
//
//  Created by Karthik Maharajan Skandarajah on 24/09/2023.
//

import UIKit

extension UIImageView {
    
    func setImage(posterPath: String) {
        guard let imageURL = URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath)") else { return }
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageURL)
            DispatchQueue.main.async {
                guard let data = data else { return }
                self.image = UIImage(data: data)
            }
        }
    }
    
}
