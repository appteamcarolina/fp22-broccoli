//
//  ContentView.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 3/29/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: ResultsListView()) {
                Text("Click")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
