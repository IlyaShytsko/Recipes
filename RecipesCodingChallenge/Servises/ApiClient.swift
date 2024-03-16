//
//  ApiClient.swift
//  RecipesCodingChallenge
//
//  Created by Ilya Shytsko on 15.03.24.
//

import UIKit
import Alamofire

final class ApiClient {
    
    static func request<Model: Decodable>(_ route: ApiRouter) async throws -> Model {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
        
        let response = await AF.request(route).validate().serializingDecodable(Model.self, decoder: decoder).response
        
        switch response.result {
        case .success(let model):
            return model
        case .failure(let error):
            throw response.serviceError(error)
        }
    }
}
