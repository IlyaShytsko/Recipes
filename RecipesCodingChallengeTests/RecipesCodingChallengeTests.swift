//
//  RecipesCodingChallengeTests.swift
//  RecipesCodingChallengeTests
//
//  Created by Ilya Shytsko on 14.03.24.
//

import XCTest
@testable import RecipesCodingChallenge

final class RecipesCodingChallengeTests: XCTestCase {

    func testRecipeSearchRequestParameters() throws {
        let searchText = "chicken"
        let router = ApiRouter.recipeSearch(searchText)
        
        let request = try router.asURLRequest()
        
        XCTAssertEqual(request.url?.path, "/api/recipes/v2", "The path should match the expected path.")
        
        guard let url = request.url, let components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            XCTFail("Failed to parse URLs and components")
            return
        }

        XCTAssertTrue(components.queryItems?.contains(URLQueryItem(name: "q", value: searchText)) ?? false, "The search parameter must be in the query")
        XCTAssertTrue(components.queryItems?.contains(URLQueryItem(name: "app_key", value: AppConfig.apiKey)) ?? false, "API key must be in the request")
        XCTAssertTrue(components.queryItems?.contains(URLQueryItem(name: "app_id", value: AppConfig.appId)) ?? false, "The application ID must be in the request")
        XCTAssertTrue(components.queryItems?.contains(URLQueryItem(name: "type", value: "any")) ?? false, "The type of request must be in the query")
    }
}
