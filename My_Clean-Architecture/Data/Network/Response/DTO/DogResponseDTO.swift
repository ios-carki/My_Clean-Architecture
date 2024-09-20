//
//  DogResponseDTO.swift
//  My_Clean-Architecture
//
//  Created by Carki on 9/18/24.
//

import Foundation

struct DogResponseDTO: Codable {
    let fileSizeBytes: Int
    let url: String
}

extension DogResponseDTO {
    func toDog() -> Dog {
        Dog(stringURL: self.url)
    }
}
