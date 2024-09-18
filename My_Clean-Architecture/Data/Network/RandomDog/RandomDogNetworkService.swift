//
//  RandomDogNetworkService.swift
//  My_Clean-Architecture
//
//  Created by Carki on 9/18/24.
//

import Foundation

import Alamofire
import Factory

class RandomDogNetworkService: BaseNetworkService {
    func get<T>(_ host: String, url: String) async -> Result<T, NetworkResponseError> where T: Codable {
        
        await request(host, url: url, method: .get).mapError { apiError in
            self.decodeError(apiError)
        }
    }
    
    private func decodeError(_ apiError: APIError) -> NetworkResponseError {
        switch apiError {
        case .customError(let data):
            if let failResponse: ErrorResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data) {
                return NetworkResponseError(rawValue: failResponse.message) ?? NetworkResponseError.NORMAL
            }
            return NetworkResponseError.NORMAL
        default:
            return NetworkResponseError.NORMAL
        }
    }
}
