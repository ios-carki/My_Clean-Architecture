//
//  GetRandomDogImageUseCase.swift
//  My_Clean-Architecture
//
//  Created by Carki on 9/18/24.
//

import Foundation

final class GetRandomDogImageUseCase {
    let repository: RandomDogRepository
    
    init(repository: RandomDogRepository) {
        self.repository = repository
    }
    
    func execute() async -> Result<DogResponseDTO, NetworkError> {
        await self.repository.getRandomImage().mapError{ $0.toNetworkError() }
    }
}
