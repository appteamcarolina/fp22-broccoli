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
        ScrollView {
            switch vm.queryStatus {
            case .loading:
                LoadingView()
            case .success:
                VStack(alignment: .leading) {
                    ForEach(vm.recommendationList, id: \.name) { item in
                        MediaEntryView(TDData: item)
                        Divider()
                    }
                }
                .padding()
            case .failure:
                Text("Failed to fetch recommendations.")
            case .idle:
                Text("Something went wrong")
            }
            
        }
        .navigationTitle("Results")
    }
}

struct ResultsListView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsListView(vm: MainViewModel.example)
    }
}
