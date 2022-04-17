//
//  ArtistDetailedView.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 3/31/22.
//

import SwiftUI

struct MediaDetailedView: View {
    let vm: EntryViewModel
    @State var teaserIsCollapsed = true
    @State var teaserLineLimit: Int? = 10
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .leading) {
                    if vm.imgURLString != nil {
                        AsyncImage(url: URL(string: vm.imgURLString!)) { phase in
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
                        Text(vm.data.name)
                            .font(.custom("Times", size: 34, relativeTo: .title))
                            .foregroundColor(.primary)
                            .italic()
                            .bold()
                        HStack {
                            Text(MediaType(rawValue: vm.data.type)!.toString())
                                .foregroundColor(.secondary)
                            Spacer()
                            Button {
                                if !vm.isInWaitlist {
                                    vm.addToWatchlist()
                                } else {
                                    vm.deleteFromWatchlist()
                                }
                            } label: {
                                Image(systemName: vm.isInWaitlist ? "star.fill" : "star")
                            }
                        }
                        Rectangle()
                            .frame(width: geo.size.width*0.2, height: 2)
                            .background(.secondary)
                            .foregroundColor(.secondary)
                        Button {
                            withAnimation {
                                teaserIsCollapsed.toggle()
                            }
                        } label: {
                            VStack(alignment:.leading) {
                                HStack {
                                    Text("Summary")
                                        .bold()
                                        .padding(.bottom, 3)
                                        .font(.title3)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .rotationEffect(.degrees(teaserIsCollapsed ? 0 : 90))
                                }
                                Text(vm.data.wTeaser)
                                    .lineLimit(teaserIsCollapsed ? 10 : nil)
                                
                            }
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        .buttonStyle(.plain)
                        
                    }
                    .padding()
                }
            }
        }
    }
}

struct MediaDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        MediaDetailedView(vm: EntryViewModel(data: TDItem.example))
    }
}
