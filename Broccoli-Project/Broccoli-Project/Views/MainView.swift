//
//  ContentView.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 3/29/22.
//

import SwiftUI
import WrappingHStack

struct MainView: View {
    private let mediaTypes = MediaType.allCases
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var vm = MainViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                Image(colorScheme == .dark ? "tastey-dark-mode" : "tastey-logo")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 50)
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
                ColoredTypePicker(selectedType: $vm.selectedQueryType, list: mediaTypes)
                    .frame(height:40)
                    .padding()
                
                Button {
                    vm.addQueryItem()
                } label: {
                    Text("Add Search Term")
                        .padding()
                        .background(TasteyColors.tongueColor)
                        .foregroundColor(.primary)
                        .clipShape(Capsule())
                }
                
                WrappingHStack(vm.queryList) { query in
                    QueryItemView(item: query, vm: vm)
                        .padding(.vertical, 2)
                }
                .padding()
                
                NavigationLink(destination: ResultsListView(vm: vm), isActive: $vm.navLinkIsActive) {
                    Button(action: {
                        vm.fetchRecommendations()
                        vm.navLinkIsActive = true
                    }) {
                        Text("Recommend Media")
                            .padding()
                            .background(TasteyColors.tongueColor)
                            .foregroundColor(.primary)
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
