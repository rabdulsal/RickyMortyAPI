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
        
        NavigationStack {
            ScrollView {
                ForEach(charsViewModel.characters) { char in
                    NavigationLink(destination: CharacterDetailsView(character: char)) {
                        LazyVStack(alignment: .leading, spacing: 8) {
                            HStack {
                                AsyncImage(url: URL(string: char.image)) { obj in
                                    if let image = obj.image {
                                        image
                                            .resizable()
                                            .scaledToFit()
                                    } else {
                                        Color.gray
                                    }
                                }
                            }
                            
                            Divider()
                        }
                    }
                    .padding(.bottom, 10)
                }
                
            }
            .padding()
            .onAppear {
                charsViewModel.searchCharacters(for: "Rick")
            }
        }
    }
}

#Preview {
    ContentView()
}
