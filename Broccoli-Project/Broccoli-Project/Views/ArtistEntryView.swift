//
//  ArtistEntryView.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 4/10/22.
//

import SwiftUI

struct ArtistEntryView: View {
    let TDData: TDItem
    let imgURLString: String?
    init(TDData: TDItem) {
        self.TDData = TDData
        imgURLString = HTMLParser.getImageURLString(wURLString: TDData.wUrl)
    }
    
    var body: some View {
        HStack {
            if imgURLString != nil {
                AsyncImage(url: URL(string: imgURLString!)) { phase in
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
                .frame(width: 60, height: 60, alignment: .top)
                .clipShape(Circle())
            }
            else {
                Image(systemName: "exclamationmark.icloud")
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            }
            
            VStack(alignment: .leading) {
                Text(TDData.name)
                    .foregroundColor(.primary)
                    .lineLimit(1)
                Text(MediaType(rawValue: TDData.type)?.toString() ?? "Unknown")
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

struct ArtistEntryView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistEntryView(TDData: TDItem.example)
    }
}
