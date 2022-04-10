//
//  GenericEntryView.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 4/10/22.
//

import SwiftUI

struct GenericEntryView: View {
    let TDData: TDItem
    var body: some View {
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
            .cornerRadius(5)
            
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

struct GenericEntryView_Previews: PreviewProvider {
    static var previews: some View {
        GenericEntryView(TDData: TDItem.example)
    }
}
