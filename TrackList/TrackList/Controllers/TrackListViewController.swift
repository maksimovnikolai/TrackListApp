//
//  TrackListViewController.swift
//  TrackList
//
//  Created by Nikolai Maksimov on 30.12.2023.
//

import UIKit

final class TrackListViewController: UIViewController {
    
    // MARK: Private properties
    private lazy var tableView = makeTableView()
    private var trackList = Track.getTrackList()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
}

// MARK: - Private methods
extension TrackListViewController {
    
    private func commonInit() {
        title = "Track List"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "track")
        setupConstraints()
        setupEditButton()
    }
    
    private func makeTableView() -> UITableView {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 80
        return tableView
    }
    
    private func setupEditButton() {
        let title = tableView.isEditing ? "Done" : "Edit"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(isEdit))
    }
    
    @objc
    private func isEdit() {
        tableView.isEditing.toggle()
    }
}

// MARK: - UITableViewDataSource
extension TrackListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        trackList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "track", for: indexPath)
        let track = trackList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = track.song
        content.secondaryText = track.artist
        content.image = UIImage(named: track.title)
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        cell.contentConfiguration = content
        return cell
    }
}

// MARK: - UITableViewDelegate
extension TrackListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let detailVC = TrackDetailsViewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let track = trackList.remove(at: sourceIndexPath.row)
        trackList.insert(track, at: destinationIndexPath.row)
    }
}

// MARK: - Constraints
extension TrackListViewController {
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
