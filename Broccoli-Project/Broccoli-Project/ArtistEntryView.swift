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
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text(artist)
                        .foregroundColor(.primary)
                    Text("Artist")
                        .foregroundColor(.secondary)
                }
                .padding(.leading, 6)
                Spacer()
                Image(systemName: "chevron.right")
                    .padding(.trailing)
                    .foregroundColor(.secondary)
            }
            
        }
    }
}

struct ArtistEntryView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistEntryView(artist: "Pink Floyd")
    }
}
