//
//  CharacterDetailsView.swift
//  RickyMortyAPI
//
//  Created by Rashad Abdul-Salam on 3/27/25.
//

import Foundation
import SwiftUI

struct CharacterDetailsView: View {
    var character: CharacterItem
        
        var body: some View {
            ScrollView {
                VStack(spacing: 8) {
                    // The image of the character in full width.
                    AsyncImage(url: URL(string: character.image)) { obj in
                        if let image = obj.image {
                            image
                                .resizable()
                                .scaledToFill()
                        } else {
                            Color.gray
                        }
                    }
                    .padding(.bottom, 20)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(character.name)
                                .font(.headline)
                            
                            // Text element that displays the species.
                            Text(character.species)
                                .font(.body)
                            
                            // Text element that displays the status.
                            Text("(\(character.status))")
                                .font(.subheadline)
                            
                            Spacer()
                        }
                        
                        // Text element that displays the origin.
                        Text("Origin: \(character.origin.name)")
                            .font(.subheadline)
                        
                         //Text element that displays the type only if available.
                        if let type = character.type, !type.isEmpty {
                            Text("Type: \(type)")
                                .font(.subheadline)
                        }
                        
                        // TODO: Text element that displays a formatted version of the created date.
                        Text("Created: \(DateFormatter.formattedPublishDate(character.created))")
                            .font(.subheadline)
                    }
                    .padding(.horizontal, 24)
                }
                
            }
            .ignoresSafeArea(edges: .top)
        }
}

#Preview {
    CharacterDetailsView(character: CharacterItem(id: 1, name: "Rick", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", species: "Human", status: "Alive", origin: CharacterItem.Origin(name: "Earth", url: "https://rickandmortyapi.com/api/location/1"), type: "Main", created: "2017-11-04T18:48:46.250Z"))
}
