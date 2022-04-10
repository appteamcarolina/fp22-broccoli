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
        NavigationLink(destination: ArtistDetailedView()) {
            HStack {
                AsyncImage(url: URL(string: HTMLParser.getImageURLString(wURLString: TDData.wUrl)!)) { phase in
                    switch phase {
                    case .empty:
                        Color.purple.opacity(0.1)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                    case .failure(_):
                        Image(systemName: "exclamationmark.icloud")
                            .resizable()
                            .scaledToFit()
                    @unknown default:
                        Image(systemName: "exclamationmark.icloud")
                    }
                }
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                    
                VStack(alignment: .leading) {
                    Text(TDData.name)
                        .foregroundColor(.primary)
                    Text(TDData.type)
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

struct MediaEntryView_Previews: PreviewProvider {
    static var previews: some View {
        MediaEntryView(TDData: TDItem(name: "Pink Floyd", type: "band"))
    }
}
