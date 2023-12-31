//
//  TrackDetailsViewController.swift
//  TrackList
//
//  Created by Nikolai Maksimov on 01.01.2024.
//

import UIKit

final class TrackDetailsViewController: UIViewController {
    
    var track: Track!
    
    // MARK: Private properties
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
    
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
      commonInit()
    }
}

// MARK: - Private methods
extension TrackDetailsViewController {
    
    private func commonInit() {
        view.backgroundColor = UIColor(red: 248/255, green: 250/255, blue: 229/255, alpha: 1)
        setupConstraintsForImageView()
        setupConstraintsForTitleLabel()
        updateUI()
    }
    
    private func updateUI() {
        coverImage.image = UIImage(named: track.title)
        trackTitleLabel.text = track.title
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
