//
//  CharactersViewModel.swift
//  RickyMortyAPI
//
//  Created by Rashad Abdul-Salam on 3/27/25.
//

import Foundation

enum DataFetchState {
    case idle, isFetching, fetched, fetchFailed(_ errorDesc: String)
}

@MainActor
class CharactersViewModel: ObservableObject {
    
    @Published var characters = [CharacterItem]()
    @Published var fetchState: DataFetchState = .idle
    let networkService = NetworkingService<CharacterData>()
    
    func searchCharacters(for searchString: String) {
        guard !searchString.isEmpty else {
            fetchState = .idle
            
            return
        }
        
        Task {
            do {
                let result = try await self.networkService.searchCharacters(for: searchString)
                switch result {
                case .success(let charData):
                    fetchState = .fetched
                    characters = charData.results
                case .failure(let error):
                    fetchState = .fetchFailed(error.localizedDescription)
                }
            } catch {
                fetchState = .fetchFailed(error.localizedDescription)
            }
        }
    }
    
}
