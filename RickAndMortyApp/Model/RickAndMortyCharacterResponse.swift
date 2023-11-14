//
//  RickAndMortyCharacterResponse.swift
//  RickAndMortyApp
//
//  Created by Paul Ancajima on 11/13/23.
//

import Foundation

struct RickAndMortyCharactersResponse: Codable {
    let info: Info
    let results: [RickAndMortyCharacter]
}

struct Info: Codable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}

struct Origin: Codable {
    let name: String
    let url: String
}
struct Location: Codable {
    let name: String
    let url: String
}

struct RickAndMortyCharacter: Codable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String  // ImageURL "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
    let episode: [String]
    let url: String
    let created: String // Date format 2017-11-04T18:48:46.250Z
}
