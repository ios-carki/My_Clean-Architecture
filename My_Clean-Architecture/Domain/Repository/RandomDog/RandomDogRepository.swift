//
//  RandomDogRepository.swift
//  My_Clean-Architecture
//
//  Created by Carki on 9/18/24.
//

import Foundation

protocol RandomDogRepository {
    func getRandomImage() async -> Result<Dog, NetworkResponseError>
}
