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
    
    @Published var charData = "No Data"
    @Published var fetchState: DataFetchState = .idle
    let networkService = NetworkingService()
    
    func searchCharacters(for searchString: String) {
        guard !searchString.isEmpty else {
            fetchState = .idle
            
            return
        }
        
        Task {
            do {
                let result = try await networkService.searchCharacters(for: searchString)
                switch result {
                case .success(let data):
                    fetchState = .fetched
                    charData = String(data: data, encoding: .utf8) ?? "No Data"
                case .failure(let error):
                    fetchState = .fetchFailed(error.localizedDescription)
                }
            } catch {
                fetchState = .fetchFailed(error.localizedDescription)
            }
        }
    }
    
}
