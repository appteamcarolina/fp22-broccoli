//
//  ContentView.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 3/29/22.
//

import SwiftUI

struct MainView: View {
    private let mediaTypes = MediaType.allCases
    @StateObject private var vm = MainViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search Bar", text: $vm.searchBarContent)
                        .disableAutocorrection(true)
                        .onSubmit {
                            vm.queryList.append(TDQuery(name: vm.searchBarContent, type: vm.selectedQueryType))
                            vm.selectedQueryType = .band
                            vm.searchBarContent = ""
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
                
                ForEach(vm.queryList) { query in
                    Text(query.name)
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
