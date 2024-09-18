//
//  DogAPI.swift
//  My_Clean-Architecture
//
//  Created by Carki on 9/18/24.
//

import Foundation

import Alamofire

class DogAPI {
    var host: String
    let networkService: RandomDogNetworkService
    
    init(networkService: RandomDogNetworkService, host: String) {
        self.networkService = networkService
        self.host = host
    }
}

extension DogAPI {
    func getRandomDogImage() async -> Result<DogResponseDTO, NetworkResponseError> {
        await self.networkService.get(self.host, url: RandomDogEndpoint.getDog.getDog.url)
    }
}
