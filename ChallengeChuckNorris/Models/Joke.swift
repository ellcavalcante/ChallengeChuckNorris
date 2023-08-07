//
//  Joke.swift
//  ChallengeChuckNorris
//
//  Created by Ellington Cavalcante on 26/07/23.
//

import Foundation

// MARK: - JokesModel
struct Joke: Decodable {
    var categories: [String]
    var createdAt: String
    var iconURL: String
    var id, updatedAt: String
    var url: String
    var value: String

    enum CodingKeys: String, CodingKey {
        case categories
        case createdAt = "created_at"
        case iconURL = "icon_url"
        case id
        case updatedAt = "updated_at"
        case url, value
    }
}
