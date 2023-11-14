//
//  NetworkService.swift
//  RickAndMortyApp
//
//  Created by Paul Ancajima on 11/12/23.
//

import Foundation
import UIKit

final class NetworkService: ObservableObject, NetworkServiceRequests {
    
    func fetchCharacters(page: Int = 1) async throws -> [RickAndMortyCharacter] {
        let urlString = "https://rickandmortyapi.com/api/character?page=\(page)"
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw URLError(.badServerResponse) }
        let characters = try JSONDecoder().decode(RickAndMortyCharactersResponse.self, from: data)
        return characters.results
    }
    
    func fetchImageFrom(urlString: String) async throws -> UIImage? {
        var result: UIImage?
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        result = UIImage(data: data)
        return result
    }
}

protocol NetworkServiceRequests {
    func fetchCharacters(page: Int) async throws -> [RickAndMortyCharacter]
    func fetchImageFrom(urlString: String) async throws -> UIImage?
}
