//
//  ArtistEntryView.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 3/31/22.
//

import SwiftUI

struct MediaEntryView: View {
    let TDData: TDItem
    var body: some View {
        NavigationLink(destination: MediaDetailedView(TDData: TDData)) {
            switch TDData.type {
            case "music":
                ArtistEntryView(TDData: TDData)
            default:
                GenericEntryView(TDData: TDData)
            }
        }
        
    }
}

struct MediaEntryView_Previews: PreviewProvider {
    static var previews: some View {
        MediaEntryView(TDData: TDItem.example)
    }
}
