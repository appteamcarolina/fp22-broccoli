//
//  GenericEntryView.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 4/10/22.
//

import SwiftUI

struct GenericEntryView: View {
    @ObservedObject var vm: EntryViewModel
    var body: some View {
        HStack {
            if vm.imgURLString != nil {
                AsyncImage(url: URL(string: vm.imgURLString!)) { phase in
                    switch phase {
                    case .empty:
                        NoImageAvailableView()
                            .frame(width: 60, height: 60)
                            .cornerRadius(5)
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
            }
            else {
                ZStack {
                    ProgressView()
                    Color.gray.opacity(0.2)
                }
                    .frame(width: 60, height: 60)
                    .cornerRadius(5)
            }
            
            
            VStack(alignment: .leading) {
                Text(vm.data.name)
                    .foregroundColor(.primary)
                    .lineLimit(1)
                Text(MediaType(rawValue: vm.data.type)!.toString())
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
        GenericEntryView(vm: EntryViewModel(data: TDItem.example))
    }
}
