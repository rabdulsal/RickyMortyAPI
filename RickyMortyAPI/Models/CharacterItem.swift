//
//  CharacterItem.swift
//  RickyMortyAPI
//
//  Created by Rashad Abdul-Salam on 3/27/25.
//

import Foundation

struct CharacterData: Codable {
    let results: [CharacterItem]
}

struct CharacterItem: Codable, Identifiable {
    struct Origin: Codable {
        let name: String
        let url: String
    }
    let id: Int
    let name: String
    let image: String
    let species: String
    let status: String
    let origin: Origin
    var type: String?
    let created: String
}
