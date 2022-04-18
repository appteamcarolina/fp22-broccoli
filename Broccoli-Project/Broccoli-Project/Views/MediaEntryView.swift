//
//  ArtistEntryView.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 3/31/22.
//

import SwiftUI

struct MediaEntryView: View {
    let vm: EntryViewModel
    var body: some View {
        NavigationLink(destination: MediaDetailedView(vm: vm)) {
            switch vm.data.type {
            case "music":
                ArtistEntryView(vm: vm)
            case "author":
                ArtistEntryView(vm: vm)
            default:
                GenericEntryView(vm: vm)
            }
        }
        .task {
            DispatchQueue.global().async {
                vm.fetchImageURL()
            }
        }
        
    }
}

struct MediaEntryView_Previews: PreviewProvider {
    static var previews: some View {
        MediaEntryView(vm: EntryViewModel(data: TDItem.example))
    }
}
