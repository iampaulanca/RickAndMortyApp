//
//  RickAndMortyAppTests.swift
//  RickAndMortyAppTests
//
//  Created by Paul Ancajima on 11/12/23.
//

import XCTest
import UIKit
import SwiftUI
import Foundation
@testable import RickAndMortyApp

final class RickAndMortyAppTests: XCTestCase {
    var homeViewModel: HomeViewModel!
    var networkService: NetworkService!

    override func setUp() async throws {
        self.networkService = MockNetworkService()
        self.homeViewModel = MockHomeViewModel(service: networkService)
    }
    
    func testSanity() {
        XCTAssert(1==1)
    }
    
    func testFetchCharactersOnInit() async {
        var homeViewModel = MockHomeViewModel(service: networkService)
        try! await Task.sleep(for: .seconds(1))
        XCTAssertNotNil(homeViewModel.rickAndMortyCharacters)
        XCTAssert(homeViewModel.rickAndMortyCharacters?[0].name == rickSanchez.name)
        XCTAssert(homeViewModel.rickAndMortyCharacters?[1].name == rickSanchez.name)
        XCTAssert(homeViewModel.rickAndMortyCharacters?[2].name == rickSanchez.name)
    }
    
    
    func testFetchCharactersErrorThrown() async {
        let error = URLError(.badServerResponse)
        var networkService = MockNetworkService()
        networkService.errorThrownFetchCharacters = error
        var homeViewModel = MockHomeViewModel(service: networkService)
        try! await Task.sleep(for: .seconds(1))
        XCTAssertFalse(homeViewModel.errorString.isEmpty)
        XCTAssertTrue(homeViewModel.errorShow)
    }
    
    func testFetchImageErrorThrown() async {
        let error = URLError(.badServerResponse)
        var networkService = MockNetworkService()
        networkService.errorThrownFetchImage = error
        var homeViewModel = MockHomeViewModel(service: networkService)
        _ = await homeViewModel.fetchImageFrom(urlString: "https://someURL.com")
        try! await Task.sleep(for: .seconds(1))
        XCTAssertFalse(homeViewModel.errorString.isEmpty)
        XCTAssertTrue(homeViewModel.errorShow)
    }

}

class MockHomeViewModel: HomeViewModel {
    
}

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
        
        var uiImage: UIImage? = UIImage(systemName: "house")
        return uiImage
    }
    
}
