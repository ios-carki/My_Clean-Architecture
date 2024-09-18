//
//  ContentView.swift
//  My_Clean-Architecture
//
//  Created by Carki on 9/18/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            
            Spacer()
            AsyncImage(url: URL(string: viewModel.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Color.gray
            }
            
            Spacer()
            
            Button(action: {
                Task {
                    await viewModel.getDogImage()
                }
            }, label: {
                Text("Load Image")
            })
            .buttonStyle(BorderedProminentButtonStyle())
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
