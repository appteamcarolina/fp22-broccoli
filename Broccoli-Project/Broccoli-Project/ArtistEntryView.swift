//
//  ArtistEntryView.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 3/31/22.
//

import SwiftUI

struct ArtistEntryView: View {
    let artist: String
    var body: some View {
        NavigationLink(destination: ArtistDetailedView()) {
            Text(artist)
            .bold()
        }
    }
}

struct ArtistEntryView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistEntryView(artist: "Pink Floyd")
    }
}
