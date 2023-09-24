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
        configureTableView()
        bindViewModel()
        viewModel.fetchData()
    }
    
    // MARK: - Setup
    
    private func configureTableView() {
        tableView.registerClassWithDefaultIdentifier(UITableViewCell.self)
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func bindViewModel() {
        viewModel.didUpdateState = { [weak self] in
            DispatchQueue.main.async {
                self?.renderCurrentState()
            }
        }
    }
    
    // MARK: - State rendering
    
    private func renderCurrentState() {
        switch viewModel.state {
        case .loading:
            // TODO: Render Loading state.
            break
        case .loaded:
            tableView.reloadData()
        case .error:
            showError()
        }
    }
    
    private func showError() {
        let alertController = UIAlertController(title: "Could not fetch movies", message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Retry", style: .default) { [weak self] _ in
            self?.viewModel.fetchData()
        }
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }

}

// MARK: - UITableViewDataSource
extension PopularMoviesViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.state.movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithDefaultIdentifier() as? UITableViewCell else {
            return UITableViewCell()
        }
        let movie = viewModel.state.movies[indexPath.row]
        cell.textLabel?.text = movie.title
        return cell
    }

}
