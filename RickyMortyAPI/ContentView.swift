//
//  ContentView.swift
//  RickyMortyAPI
//
//  Created by Rashad Abdul-Salam on 3/27/25.
//

import SwiftUI

struct ContentView: View {
    
    
    @State var charData = "Hello World"
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(charData)
        }
        .padding()
        .onAppear {
            Task {
                let resp = try await searchCharacters(for: "Rick")
                switch resp {
                case .failure(let error):
                    print("Error: \(error)")
                case .success(let data):
                    charData = String(data: data, encoding: .utf8) ?? "No Data"
                    
                }
                
            }
        }
    }
    
    func searchCharacters(for name: String) async throws -> Result<Data,Error> {
                 
        let urlString = "https://rickandmortyapi.com/api/character/?name=\(name)"
             
         guard let url = URL(string: urlString) else { /*throw NetworkError.badURL*/ print("Bad URL"); return .failure(NSError(domain: "Bad URL", code: 0, userInfo: nil)) }
             
         do {
             let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
             
             guard let res = response as? HTTPURLResponse, (200...299).contains(res.statusCode) else {
//                     throw NetworkError.failedResponse
                 print("Failed Response")
                 return .failure(NSError(domain: "Failed Response", code: 0, userInfo: nil))
             }
             
             print("Data \(String(data: data, encoding: .utf8))")
             return .success(data)
         } catch {
             
             throw error
         }
     }
}

#Preview {
    ContentView()
}
