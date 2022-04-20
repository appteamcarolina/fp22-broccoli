//
//  ResultsListView.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 3/31/22.
//

import SwiftUI
import WrappingHStack

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
                    ScrollView(.horizontal) {
                        HStack {
                            Text("Searches: ")
                                .font(.title3)
                            ForEach(vm.queryList) { query in
                                QueryItemView(item: query, vm: vm)
                                    .padding(.vertical, 2)
                            }
                        }
                    }
                    .padding(.bottom, 5)
                    Divider()
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
            .navigationBarTitleDisplayMode(.inline)
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
