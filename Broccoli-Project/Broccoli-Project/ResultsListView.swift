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
                Text("Loading...")
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
        .task {
            do {
                vm.queryStatus = .loading
                vm.recommendationList = try await TasteDiveService.fetchRecommendations(queryItems: vm.queryList)
                vm.queryStatus = .success
            }
            catch {
                vm.queryStatus = .failure
                print(error)
            }
        }
    }
}

struct ResultsListView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsListView(vm: MainViewModel())
    }
}
