//
//  ContentView.swift
//  RickyMortyAPI
//
//  Created by Rashad Abdul-Salam on 3/27/25.
//

import SwiftUI

struct ContentView: View {
    
    
    @StateObject private var charsViewModel = CharactersViewModel()
    @State var searchText = ""
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                // SearchBar
                SearchBarView(searchText: $searchText) {
                    charsViewModel.searchCharacters(for: searchText)
                }
                
                switch charsViewModel.fetchState {
                case .idle:
                    Text("Search for a R&M Character")
                        .font(.largeTitle)
                case .isFetching:
                    ProgressView("Fetching Character....")
                        .controlSize(.extraLarge)
                case.fetched:
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
                case .fetchFailed(let errorDesc):
                    Text(errorDesc).font(.largeTitle)
                }
                
                Spacer()
            }
            .padding()
//            .onAppear {
//                charsViewModel.searchCharacters(for: "Rick")
//            }
        }
    }
}

#Preview {
    ContentView()
}
