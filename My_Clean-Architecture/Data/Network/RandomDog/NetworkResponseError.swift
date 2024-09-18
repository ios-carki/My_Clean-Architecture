//
//  NetworkResponseError.swift
//  My_Clean-Architecture
//
//  Created by Carki on 9/18/24.
//

import Foundation

enum NetworkResponseError: String, Error {
    case UNKNOWN
    case NORMAL
    
    func toNetworkError() -> NetworkError {
        NetworkError(rawValue: self.rawValue) ?? NetworkError.UNKNOWN
    }
}
