//
//  RandomDogEndpoint.swift
//  My_Clean-Architecture
//
//  Created by Carki on 9/18/24.
//

import Foundation

class RandomDogEndpoint {
    enum getDog: EndPoint {
        case getDog
        
        var url: String {
            switch self {
            case .getDog:
                return "woof.json"
            }
        }
    }
}
