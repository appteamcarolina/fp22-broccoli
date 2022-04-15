//
//  GenericEntryView.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 4/10/22.
//

import SwiftUI

struct GenericEntryView: View {
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
                            .scaledToFit()
                    case .failure(_):
                        Image(systemName: "exclamationmark.icloud")
                            .resizable()
                            .scaledToFit()
                    @unknown default:
                        Image(systemName: "exclamationmark.icloud")
                    }
                }
                .frame(width: 60, height: 60)
                .cornerRadius(5)
            }
            else {
                Image(systemName: "exclamationmark.icloud")
                .frame(width: 60, height: 60)
                .cornerRadius(5)
            }
            
            
            VStack(alignment: .leading) {
                Text(TDData.name)
                    .foregroundColor(.primary)
                    .lineLimit(1)
                Text(MediaType(rawValue: TDData.type)!.toString())
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

struct GenericEntryView_Previews: PreviewProvider {
    static var previews: some View {
        GenericEntryView(TDData: TDItem.example)
    }
}
