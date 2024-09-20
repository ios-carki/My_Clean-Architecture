//
//  RealRandomDogRepository.swift
//  My_Clean-Architecture
//
//  Created by Carki on 9/18/24.
//

import Foundation

class RealRandomDogRepository: RandomDogRepository {
    let api: DogAPI
    
    init(api: DogAPI) {
        self.api = api
    }
    
    func getRandomImage() async -> Result<Dog, NetworkResponseError> {
        await api.getRandomDogImage().map{ $0.toDog() }
    }
}
