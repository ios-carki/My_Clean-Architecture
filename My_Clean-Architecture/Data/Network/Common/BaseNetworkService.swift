//
//  BaseNetworkService.swift
//  My_Clean-Architecture
//
//  Created by Carki on 9/18/24.
//

import Foundation

import Alamofire

class BaseNetworkService {
    let session: Session = {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 5 * 60
        configuration.waitsForConnectivity = true
        
        return Session(
            configuration: configuration
        )
    }()
}

extension BaseNetworkService {
    func request<T>(
        _ host: String,
        url: String,
        auth: Bool? = nil,
        method: HTTPMethod,
        headers requestHeaders: [String: String]? = nil,
        parameters: Parameters? = nil,
        httpBody: Any? = nil
    ) async -> Result<T, APIError> where T: Codable {
        var headers: HTTPHeaders = HTTPHeaders()
        headers.add(name: "content-Type", value: "application/json")
        headers.add(name: "accept", value: "application/json")
        
        if let headerItems = requestHeaders {
            headerItems.forEach { (key: String, value: String) in
                headers.add(name: key, value: value)
            }
        }
        
        let baseURL = host + url
        var request = self.session
            .request(baseURL, method: method, parameters: parameters, encoding: URLEncoding.queryString, headers: headers)
            .cURLDescription { description in
                print(description)
            }
        
        
        if let data = httpBody, var req = try? request.convertible.asURLRequest() {
            if let body = try? JSONSerialization.data(withJSONObject: data, options: []) {
                req.httpBody = body
            }
            req.timeoutInterval = 5 * 60
            request = AF.request(req)
                .cURLDescription { description in
                    print(description)
                }
        }
        
        let dataTask = request
            .validate(statusCode: 200..<300)
            .serializingDecodable(T.self)
            


        switch await dataTask.result {
        case .success(let response):
            return .success(response)
        case .failure(let error):
            print("------------🔺FAIL🔺------------")
            print("🔺\(error)")
            print("---------------------------------")
            if let data = await dataTask.response.data {
                return .failure(APIError.defaultError)
            }
            return .failure(APIError.Unknown)
        }
    }
}
