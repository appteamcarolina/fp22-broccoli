//
//  ResultsListView.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 3/31/22.
//

import SwiftUI

struct ResultsListView: View {
    @ObservedObject var vm: MainViewModel = MainViewModel()
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(TasteDiveService.getExampleData(), id: \.name) { item in
                    ArtistEntryView(artist: item.name)
                    Divider()
                }
            }
            .padding()
        }
        .navigationTitle("Results")
    }
}

struct ResultsListView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsListView()
    }
}
