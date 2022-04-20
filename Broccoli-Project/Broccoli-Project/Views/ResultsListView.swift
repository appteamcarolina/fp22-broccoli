//
//  ResultsListView.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 3/31/22.
//

import SwiftUI

struct ResultsListView: View {
    @ObservedObject var vm: MainViewModel
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        switch vm.queryStatus {
        case .loading:
            LoadingView()
        case .success:
            ScrollView {
                VStack(alignment: .leading) {
                    if vm.recommendationList.isEmpty {
                        NoResultsView()
                    }
                    else {
                        ForEach(vm.recommendationList, id: \.name) { item in
                            MediaEntryView(vm: EntryViewModel(data: item))
                            Divider()
                        }
                    }
                }
                .padding()
            }
            .toolbar {
                                ToolbarItem(placement: .principal) {
                                    Image(colorScheme == .light ? "tastey_logo_light_transparent" : "tastey_logo_dark_transparent")
                                        .resizable()
                                        .scaledToFit()
                                }
                            }
        case .failure:
            Text("Failed to fetch recommendations.")
        case .idle:
            Text("Something went wrong")
        }
    }
}

struct ResultsListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ResultsListView(vm: MainViewModel.example)
        }
    }
}
