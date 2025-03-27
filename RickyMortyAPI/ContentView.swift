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
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(charsViewModel.charData)
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
