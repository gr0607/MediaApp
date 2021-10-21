//
//  Models.swift
//  MediaApp
//
//  Created by admin on 21.10.2021.
//

import Foundation

struct SearchResponse: Codable {
    var resultCount: Int
    var results: [Music]
}

struct Music: Codable {
    var trackName: String
    var artistName: String
    var artworkUrl100: String?
}
