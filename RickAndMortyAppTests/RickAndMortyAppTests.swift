//
//  RickAndMortyAppTests.swift
//  RickAndMortyAppTests
//
//  Created by Paul Ancajima on 11/12/23.
//

import XCTest
import SwiftUI
@testable import RickAndMortyApp

final class RickAndMortyAppTests: XCTestCase {
    var homeViewModel: HomeViewModel!
    var networkService: MockNetworkService!

    override func setUp() async throws {
        self.networkService = MockNetworkService()
        self.homeViewModel = MockHomeViewModel(service: networkService)
    }
    
    func testSanity() {
        XCTAssert(1==1)
    }
    
    func testFetchCharactersOnInit() async {
        try! await Task.sleep(for: .seconds(1))
        XCTAssertNotNil(homeViewModel.rickAndMortyCharacters)
        XCTAssert(homeViewModel.rickAndMortyCharacters?[0].name == rickSanchez.name)
        XCTAssert(homeViewModel.rickAndMortyCharacters?[1].name == rickSanchez.name)
        XCTAssert(homeViewModel.rickAndMortyCharacters?[2].name == rickSanchez.name)
    }
    
    func testFetchCharactersErrorThrown() async {
        let error = URLError(.badServerResponse)
        networkService.errorThrownFetchCharacters = error
        let homeViewModel = MockHomeViewModel(service: networkService)
        try! await Task.sleep(for: .seconds(1))
        XCTAssertFalse(homeViewModel.errorString.isEmpty)
        XCTAssertTrue(homeViewModel.errorShow)
    }
    
    func testFetchImageErrorThrown() async {
        let error = URLError(.badServerResponse)
        networkService.errorThrownFetchImage = error
        _ = await homeViewModel.fetchImageFrom(urlString: "https://someURL.com")
        try! await Task.sleep(for: .seconds(1))
        XCTAssertFalse(homeViewModel.errorString.isEmpty)
        XCTAssertTrue(homeViewModel.errorShow)
    }

}
