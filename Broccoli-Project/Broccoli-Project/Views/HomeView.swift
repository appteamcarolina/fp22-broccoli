//
//  HomeView.swift
//  Broccoli-Project
//
//  Created by peter wi on 4/18/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            WatchListView(vm: WatchlistViewModel())
                .tabItem {
                    Label("Saved", systemImage: "bookmark")
                }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
