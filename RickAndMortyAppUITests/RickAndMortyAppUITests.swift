//
//  RickAndMortyAppUITests.swift
//  RickAndMortyAppUITests
//
//  Created by Paul Ancajima on 11/12/23.
//

import XCTest

final class RickAndMortyAppUITests: XCTestCase {
    
    let app = XCUIApplication()

    func testExample() throws {
        app.launch()
    }
    
    func testTapPageForwardAndBack() {
        app.launch()
        let collectionViewsQuery = app.collectionViews
        app.buttons["Forward"].tap()
        app.buttons["Back"].tap()
    }

}
