//
//  WatchListView.swift
//  Broccoli-Project
//
//  Created by peter wi on 4/16/22.
//

import SwiftUI

struct WatchListView: View {
    @ObservedObject var vm: WatchlistViewModel
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    if vm.entryList.isEmpty {
                        NoSavedView()
                    }
                    else {
                        ForEach(vm.entryList, id: \.id) { item in
                            NavigationLink(destination: WatchListDetailView(entry: item, vm: vm)) {
                                WatchListGenericEntryView(entry: item)
                            }
                            Divider()
                        }
                    }
                }
                .padding()
            }
            .onAppear {
                vm.fetchAllEntries()
            }
            .navigationTitle("Saved")
        }
    }
}

struct WatchListView_Previews: PreviewProvider {
    static var previews: some View {
        WatchListView(vm: .example)
    }
}
