//
//  ResultsListView.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 3/31/22.
//

import SwiftUI

struct ResultsListView: View {
    @ObservedObject var vm: MainViewModel
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
            .navigationTitle("Results")
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
