//
//  ApiRouter.swift
//  RecipesCodingChallenge
//
//  Created by Ilya Shytsko on 15.03.24.
//

import Foundation
import Alamofire

struct RequestConfig {
    let path: String
    let method: HTTPMethod
    var params: Parameters?
    let encoding: ParameterEncoding
}

enum ApiRouter: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        let baseUrl = AppConfig.baseUrl
        let request = try URLRequest(url: baseUrl.asURL().appendingPathComponent(config.path), method: config.method)
        return try config.encoding.encode(request, with: config.params)
    }
    
    // MARK: - Endpoints
    
    case recipeSearch(String)
    
    // MARK: - Endpoints configuration
    
    var config: RequestConfig {
        switch self {
            
            // MARK: .recipeSearch
            
        case let .recipeSearch(searchText):
            return RequestConfig(
                path: "api/recipes/v2",
                method: .get,
                params: ["q": searchText, "app_key": AppConfig.apiKey, "app_id": AppConfig.appId, "type": "any"],
                encoding: URLEncoding.default
            )
        }
    }
}
