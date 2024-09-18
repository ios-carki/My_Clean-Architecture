//
//  DIContainer.swift
//  My_Clean-Architecture
//
//  Created by Carki on 9/18/24.
//

import Foundation

import Factory

extension Container {
    var networkService: Factory<BaseNetworkService> {
        Factory(self) { BaseNetworkService() }
    }
}

// MARK: Network
extension Container {
    var randomDogNetworkService: Factory<RandomDogNetworkService> {
        Factory(self) { RandomDogNetworkService() }
    }
    
    var randomDogAPI: Factory<DogAPI> {
        Factory(self) { DogAPI(networkService: self.randomDogNetworkService(), host: "https://random.dog/")}
    }
}

// MARK: Repository
extension Container {
    var randomDogRepository: Factory<RandomDogRepository> {
        Factory(self) { RealRandomDogRepository(api: self.randomDogAPI()) }
    }
}

// MARK: UseCase
extension Container {
    var getDogImageUseCase: Factory<GetRandomDogImageUseCase> {
        Factory(self) { GetRandomDogImageUseCase(repository: self.randomDogRepository()) }
    }
}

