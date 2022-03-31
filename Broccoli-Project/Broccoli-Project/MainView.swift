//
//  ContentView.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 3/29/22.
//

import SwiftUI

enum MediaType: String, CaseIterable {
    case music = "music"
    case movie = "movie"
    case show = "show"
    case book = "book"
    case author = "author"
}

struct MainView: View {
    private let mediaTypes = MediaType.allCases
    @State private var inputKeywords = [String]()
    @State private var inputTypes = [Int]()
    @State private var searchString = ""
    @State private var selectedType = 0
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search Bar", text: $searchString)
                    .disableAutocorrection(true)
                    .onSubmit {
                        inputKeywords.append(searchString)
                        searchString = ""
                        inputTypes.append(selectedType)
                        selectedType = 0
                    }
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 30)
                .stroke())
            .padding()
            Picker("Choose a type", selection: $selectedType) {
                ForEach(MediaType.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            Button(action: {
                
            }) {
                Text("Recommend Artists")
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }
            
            ForEach(inputKeywords, id: \.self) { keyword in
                Text(keyword)
            }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
