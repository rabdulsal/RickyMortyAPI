//
//  ContentView.swift
//  RickyMortyAPI
//
//  Created by Rashad Abdul-Salam on 3/27/25.
//

import SwiftUI

struct ContentView: View {
    
    
    @StateObject private var charsViewModel = CharactersViewModel()
    
    
    var body: some View {
        VStack {
            ForEach(charsViewModel.characters) { char in
                Text(char.name)
            }
            
        }
        .padding()
        .onAppear {
            charsViewModel.searchCharacters(for: "Rick")
        }
    }
}

#Preview {
    ContentView()
}
