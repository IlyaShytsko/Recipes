//
//  RecipesCodingChallengeUITests.swift
//  RecipesCodingChallengeUITests
//
//  Created by Ilya Shytsko on 14.03.24.
//

import XCTest

final class RecipesCodingChallengeUITests: XCTestCase {

    struct AccessibilityIdentifier {
        static let searchTextField = "searchTextField"
        static let searchButton = "searchButton"
        static let recipeSearchLabel = "recipeSearch"
    }
    
    override func setUpWithError() throws {
        let app = XCUIApplication()
        app.launch()
    }

    func testSearchScreen() {
        let app = XCUIApplication()
        
        let searchTextField = app.textFields[AccessibilityIdentifier.searchTextField]
        XCTAssertTrue(searchTextField.exists, "search Text Field Not Found")
        
        let searchButton = app.buttons[AccessibilityIdentifier.searchButton]
        XCTAssertTrue(searchButton.exists, "search Button Not Found")
        
        let recipeSearchLabel = app.staticTexts[AccessibilityIdentifier.recipeSearchLabel]
        XCTAssertTrue(recipeSearchLabel.exists, "recipe Label Not Found")
        
        searchTextField.tap()
        searchTextField.typeText("chicken")
        
        app.textFields["searchTextField"].tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Search"]/*[[".buttons[\"Search\"].staticTexts[\"Search\"]",".buttons[\"searchButton\"].staticTexts[\"Search\"]",".staticTexts[\"Search\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Search Results"].buttons["Back"].tap()
        
    }
    
}
