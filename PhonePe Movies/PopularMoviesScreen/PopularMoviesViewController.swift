//
//  PopularMoviesViewController.swift
//  PhonePe Movies
//
//  Created by Karthik Maharajan Skandarajah on 24/09/2023.
//

import UIKit

final class PopularMoviesViewController: UITableViewController {
    
    // MARK: - Dependencies
    
    private let viewModel: PopularMoviesViewModel
    
    // MARK: - Init
    
    init(viewModel: PopularMoviesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Popular Movies"
    }

}
