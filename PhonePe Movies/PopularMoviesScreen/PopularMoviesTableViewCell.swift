//
//  PopularMoviesTableViewCell.swift
//  PhonePe Movies
//
//  Created by Karthik Maharajan Skandarajah on 24/09/2023.
//

import UIKit

final class PopularMoviesTableViewCell: UITableViewCell {
    
    private struct Constants {
        static let imageViewCornerRadius: CGFloat = 8
        static let margin: CGFloat = 16
    }
    
    // MARK: - Subviews
    
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = Constants.imageViewCornerRadius
        // TODO: Set placeholder image.
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ratingsLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .footnote)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var playlistLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .footnote)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(ratingsLabel)
        stackView.addArrangedSubview(playlistLabel)
        return stackView
    }()
    
    private lazy var detailsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(labelsStackView)
        return stackView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(posterImageView)
        stackView.addArrangedSubview(detailsStackView)
        return stackView
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutMargins = UIEdgeInsets(top: Constants.margin, left: Constants.margin, bottom: Constants.margin, right: Constants.margin)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        playlistLabel.isHidden = true
    }
    
    // MARK: - Setup
    
    private func addSubviews() {
        contentView.addSubview(mainStackView)
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            
            posterImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -(2 * Constants.margin)),
            posterImageView.heightAnchor.constraint(equalTo: posterImageView.widthAnchor, multiplier: 0.75)
        ])
    }
    
    // MARK: - Configure
    
    func configure(for movie: Movie) {
        if let posterPath = movie.posterPath {
            posterImageView.setImage(posterPath: posterPath)
        }
        titleLabel.text = movie.title
        ratingsLabel.text = "Rating: \(String(format: "%.1f", movie.voteAverage))"
    }
    
}
