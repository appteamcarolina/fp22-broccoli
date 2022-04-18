//
//  ArtistEntryView.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 4/10/22.
//

import SwiftUI

struct ArtistEntryView: View {
    @StateObject var vm: EntryViewModel    
    var body: some View {
        HStack {
            if vm.imgURLString != nil {
                AsyncImage(url: URL(string: vm.imgURLString!)) { phase in
                    switch phase {
                    case .empty:
                        TasteyColors.tongueColor.opacity(0.5)
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
                ZStack {
                    ProgressView()
                    Color.gray.opacity(0.2)
                }
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            }
            
            VStack(alignment: .leading) {
                Text(vm.data.name)
                    .foregroundColor(.primary)
                    .lineLimit(1)
                Text(MediaType(rawValue: vm.data.type)?.toString() ?? "Unknown")
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
        ArtistEntryView(vm: EntryViewModel(data: TDItem.example))
    }
}
