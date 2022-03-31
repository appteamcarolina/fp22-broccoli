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
            HStack {
                Image("pink_floyd")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text(artist)
                        .foregroundColor(.primary)
                    .bold()
                    Text("Artist")
                }
                .padding(.leading, 10)
            }
            
        }
    }
}

struct ArtistEntryView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistEntryView(artist: "Pink Floyd")
    }
}
