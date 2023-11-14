//
//  MockNetworkService.swift
//  RickAndMortyApp
//
//  Created by Paul Ancajima on 11/13/23.
//

import Foundation
import UIKit
import Combine

final class MockNetworkService: ObservableObject, NetworkServiceRequests {
    var errorThrownFetchCharacters: Error?
    var errorThrownFetchImage: Error?
   
    func fetchCharacters(page: Int = 1) async throws -> [RickAndMortyCharacter] {
        if let errorThrownFetchCharacters = errorThrownFetchCharacters {
            throw errorThrownFetchCharacters
        }
        return [rickSanchez, rickSanchez, rickSanchez]
    }
    
    func fetchImageFrom(urlString: String) async throws -> UIImage? {
        if let errorThrownFetchImage = errorThrownFetchImage {
            throw errorThrownFetchImage
        }
        let uiImage: UIImage? = UIImage(systemName: "house")
        return uiImage
    }
    
}

final class MockHomeViewModel: HomeViewModel {}
