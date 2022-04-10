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
            VStack(alignment: .leading) {
                ForEach(vm.recommendationList, id: \.name) { item in
                    MediaEntryView(TDData: item)
                    Divider()
                }
            }
            .padding()
        }
        .navigationTitle("Results")
        .task {
            do {
                vm.recommendationList = try await TasteDiveService.fetchRecommendations(queryItems: [TDQuery(name: "Rush", type: MediaType.movie)])
            }
            catch {
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
