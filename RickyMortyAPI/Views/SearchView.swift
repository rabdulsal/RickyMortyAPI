//
//  SearchView.swift
//  RickyMortyAPI
//
//  Created by Rashad Abdul-Salam on 3/27/25.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    var onSearchTextChanged: () -> Void
    
    var body: some View {
        TextField("Search", text: $searchText)
            .onChange(of: searchText) { _,_ in
                onSearchTextChanged()
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

#Preview {
    SearchBarView(searchText: .constant("Rick"), onSearchTextChanged: {})
}
