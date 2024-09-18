//
//  APIError.swift
//  My_Clean-Architecture
//
//  Created by Carki on 9/18/24.
//

import Foundation

enum APIError: Error {
    case defaultError
    case Unknown
    case customError(data: Data)
}
