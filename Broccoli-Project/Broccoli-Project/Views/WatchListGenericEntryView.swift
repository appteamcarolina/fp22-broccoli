//
//  WatchListGenericEntryView.swift
//  Broccoli-Project
//
//  Created by peter wi on 4/17/22.
//

import SwiftUI

struct WatchListGenericEntryView: View {
    let entry: EntryModel
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: entry.imageUrl)) { phase in
                switch phase {
                case .empty:
                    TasteyColors.tongueColor.opacity(0.5)
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
            .frame(width: 60, height: 60, alignment: .center)
            .cornerRadius(5)
            
            
            VStack(alignment: .leading) {
                Text(entry.name)
                    .foregroundColor(.primary)
                    .lineLimit(1)
                Text(entry.type)
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
//
//struct WatchListGenericEntryView_Previews: PreviewProvider {
//    static var previews: some View {
//        WatchListGenericEntryView()
//    }
//}
