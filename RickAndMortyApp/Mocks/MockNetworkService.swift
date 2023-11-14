//
//  MockNetworkService.swift
//  RickAndMortyApp
//
//  Created by Paul Ancajima on 11/13/23.
//

import Foundation
import UIKit

class MockNetworkService: NetworkService {
    var errorThrownFetchCharacters: Error?
    var errorThrownFetchImage: Error?
   
    override func fetchCharacters(page: Int = 1) async throws {
        if let errorThrownFetchCharacters = errorThrownFetchCharacters {
            throw errorThrownFetchCharacters
        }
        self.characters = [rickSanchez, rickSanchez, rickSanchez]
    }
    
    override func fetchImageFrom(urlString: String) async throws -> UIImage? {
        if let errorThrownFetchImage = errorThrownFetchImage {
            throw errorThrownFetchImage
        }
        let uiImage: UIImage? = UIImage(systemName: "house")
        return uiImage
    }
    
}

class MockHomeViewModel: HomeViewModel {}
