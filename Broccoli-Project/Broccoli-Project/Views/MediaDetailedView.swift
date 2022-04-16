//
//  ArtistDetailedView.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 3/31/22.
//

import SwiftUI

struct MediaDetailedView: View {
    let TDData: TDItem
    let imgURLString: String?
    init(TDData: TDItem) {
        self.TDData = TDData
        imgURLString = HTMLParser.getImageURLString(wURLString: TDData.wUrl)
    }
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .leading) {
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
                                    .scaledToFill()
                            @unknown default:
                                Image(systemName: "exclamationmark.icloud")
                            }
                        }
                        .frame(width: geo.size.width, height: geo.size.height*0.3, alignment: .top)
                        .cornerRadius(0)
                    }
                    else {
                        Image(systemName: "exclamationmark.icloud")
                        .frame(width: 60, height: 60)
                        .cornerRadius(5)
                    }
                    
                    
                    VStack(alignment: .leading) {
                        Text(TDData.name)
                            .font(.custom("Times", size: 34, relativeTo: .title))
                            .foregroundColor(.primary)
                            .italic()
                            .bold()
                        Text(MediaType(rawValue: TDData.type)!.toString())
                            .foregroundColor(.secondary)
                        Rectangle()
                            .frame(width: geo.size.width*0.2, height: 2)
                            .background(.secondary)
                            .foregroundColor(.secondary)
                        Text(TDData.wTeaser)
                            .padding(.top)
                    }
                    .padding()
                }
            }
        }
    }
}

struct MediaDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        MediaDetailedView(TDData: TDItem.example)
    }
}
