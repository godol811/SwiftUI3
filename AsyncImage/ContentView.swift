//
//  ContentView.swift
//  AsyncImage
//
//  Created by 고종찬 on 2021/12/29.
//

import SwiftUI


extension Image {
    func imageModifier() -> some View{
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self
            .imageModifier()
            .frame(maxWidth :128)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
    
}

struct ContentView: View {
    
    private let imageURL = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View {
        
        // MARK: 기초적인 부분
        /*
        AsyncImage(url: URL(string: imageURL)){image in
            image.imageModifier()
            
        } placeholder: {
            Image(systemName: "photo.circle.fill").iconModifier()
        }
        .padding(40)
        */
        // MARK: Phases
        /*
        AsyncImage(url: URL(string: imageURL)){phase in
            // SUCCESS: The image successfully loaded.
            // FAILURE: The image failed to load with an error.
            
            // EMPTY: No image is loaded.
            
            if let image = phase.image{
                image.imageModifier()
            }else if phase.error != nil{
                Image(systemName: "ant.circle.fill").iconModifier()
            }else{
                Image(systemName: "photo.circle.fill").iconModifier()
            }
            
        }
        .padding(40)
         */
        // MARK: Animation
        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))){phase in
            switch phase{
            case .success(let image):
                image.imageModifier()
//                    .transition(.move(edge: .bottom))
                    .transition(.slide)
//                    .transition(.scale)
            case .empty:
                Image(systemName: "photo.circle.fill").iconModifier()
            case .failure(_):
                Image(systemName: "ant.circle.fill").iconModifier()
            @unknown default:
                ProgressView()            }
            
        }
        .padding(40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
