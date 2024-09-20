//
//  ContentViewModel.swift
//  My_Clean-Architecture
//
//  Created by Carki on 9/18/24.
//

import Foundation

import Factory

final class ContentViewModel: ObservableObject {
    @Injected(\.getDogImageUseCase) private var getDogImageUseCase
    
    @Published var imageURL: String = ""
    
    func getDogImage() async {
        let result = await self.getDogImageUseCase.execute()
        
        switch result {
        case .success(let response):
            DispatchQueue.main.async {
                self.imageURL = response.stringURL
            }
            
        case .failure(let error):
            print(error.rawValue)
        }
    }
}
