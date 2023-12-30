//
//  Track.swift
//  TrackList
//
//  Created by Nikolai Maksimov on 30.12.2023.
//

struct Track {
    let artist: String
    let song: String
    
    var title: String {
        "\(artist) - \(song)"
    }
}
