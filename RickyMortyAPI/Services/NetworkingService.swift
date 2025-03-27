//
//  NetworkingService.swift
//  RickyMortyAPI
//
//  Created by Rashad Abdul-Salam on 3/27/25.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case failedResponse
}


struct NetworkingService<T: Codable> {
    
    func searchCharacters(for name: String) async throws -> Result<CharacterData,Error> {
                 
        let urlString = "https://rickandmortyapi.com/api/character/?name=\(name)"
             
         guard let url = URL(string: urlString) else { throw NetworkError.badURL }
             
         do {
             let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
             
             guard let res = response as? HTTPURLResponse, (200...299).contains(res.statusCode) else { throw NetworkError.failedResponse }
             let charData = try JSONDecoder().decode(CharacterData.self, from: data)
             return .success(charData)
         } catch {
             
             throw error
         }
     }
    
    
}
