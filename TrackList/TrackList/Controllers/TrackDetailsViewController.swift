//
//  TrackDetailsViewController.swift
//  TrackList
//
//  Created by Nikolai Maksimov on 01.01.2024.
//

import UIKit

final class TrackDetailsViewController: UIViewController {
    
    private lazy var coverImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private lazy var trackTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title label"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupConstraintsForImageView()
        setupConstraintsForTitleLabel()
    }
}

// MARK: - Constraints
extension TrackDetailsViewController {
    
    private func setupConstraintsForImageView() {
        view.addSubview(coverImage)
        NSLayoutConstraint.activate([
            coverImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            coverImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            coverImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            coverImage.heightAnchor.constraint(equalToConstant: 330)
        ])
    }
    
    private func setupConstraintsForTitleLabel() {
        view.addSubview(trackTitleLabel)
        NSLayoutConstraint.activate([
            trackTitleLabel.topAnchor.constraint(equalTo: coverImage.bottomAnchor, constant: 5),
            trackTitleLabel.leadingAnchor.constraint(equalTo: coverImage.leadingAnchor),
        ])
    }
}
