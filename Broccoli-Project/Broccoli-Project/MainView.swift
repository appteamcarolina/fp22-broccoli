//
//  ContentView.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 3/29/22.
//

import SwiftUI

struct MainView: View {
    private let mediaTypes = MediaType.allCases
    private let columns = [GridItem(.adaptive(minimum: 20, maximum: 200))]
    @StateObject private var vm = MainViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Enter search terms", text: $vm.searchBarContent)
                        .disableAutocorrection(true)
                        .onSubmit {
                            vm.addQueryItem()
                        }
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 30)
                    .stroke())
                .padding()
                Picker("Choose a type", selection: $vm.selectedQueryType) {
                    ForEach(MediaType.allCases, id: \.self) {
                        Text($0.toString())
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                Button {
                    vm.addQueryItem()
                } label: {
                    Text("Add Search Term")
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(vm.queryList) { query in
                        QueryItemView(item: query)
                    }
                }
                .padding()
                
                NavigationLink(destination: ResultsListView(vm: vm), isActive: $vm.navLinkIsActive) {
                    Button(action: {
                        vm.fetchRecommendations()
                        vm.navLinkIsActive = true
                    }) {
                        Text("Recommend Artists")
                            .padding()
                            .background(.blue)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
                }
                
            }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
