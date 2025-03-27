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


struct NetworkingService {
    
    func searchCharacters(for name: String) async throws -> Result<Data,Error> {
                 
        let urlString = "https://rickandmortyapi.com/api/character/?name=\(name)"
             
         guard let url = URL(string: urlString) else { throw NetworkError.badURL }
             
         do {
             let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
             
             guard let res = response as? HTTPURLResponse, (200...299).contains(res.statusCode) else {
                 print("Failed Response")
                throw NetworkError.failedResponse
             }
             
             print("Data \(String(data: data, encoding: .utf8))")
             return .success(data)
         } catch {
             
             throw error
         }
     }
    
    
}
