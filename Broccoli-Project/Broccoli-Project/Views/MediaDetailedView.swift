//
//  ArtistDetailedView.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 3/31/22.
//

import SwiftUI

struct MediaDetailedView: View {
    @ObservedObject var vm: EntryViewModel
    @State var teaserIsCollapsed = true
    @State var teaserLineLimit: Int? = 10
    @State var isInWatchList = false
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .leading) {
                    if vm.imgURLString != nil {
                        AsyncImage(url: URL(string: vm.imgURLString!)) { phase in
                            switch phase {
                            case .empty:
                                NoImageAvailableView()
                            case .success(let image):
                                ZStack {
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .blur(radius: 10)
                                        .frame(width: geo.size.width, height: geo.size.height*0.3, alignment: .top)
                                        .cornerRadius(0)
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: geo.size.height*0.3, alignment: .top)
                                        .cornerRadius(0)
                                }
                                
                            case .failure(_):
                                Image(systemName: "exclamationmark.icloud")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: geo.size.width, height: geo.size.height*0.3, alignment: .top)
                                    .cornerRadius(0)
                            @unknown default:
                                Image(systemName: "exclamationmark.icloud")
                                    .frame(width: geo.size.width, height: geo.size.height*0.3, alignment: .top)
                                    .cornerRadius(0)
                            }
                        }
                    }
                    else {
                        Image(systemName: "exclamationmark.icloud")
                            .frame(width: geo.size.width, height: geo.size.height*0.3, alignment: .top)
                            .cornerRadius(0)
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
                                withAnimation {
                                    if !(vm.isInWatchlist()) {
                                        vm.addToWatchlist()
                                        isInWatchList = true
                                    } else {
                                        vm.deleteFromWatchlist()
                                        isInWatchList = false
                                    }
                                }
                                
                            } label: {
                                Image(systemName: isInWatchList ? "bookmark.fill" : "bookmark")
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
                                Text(vm.data.wTeaser ?? "No info available.")
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
            .onAppear {
                isInWatchList = vm.isInWatchlist()
            }
        }
    }
}

struct MediaDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        MediaDetailedView(vm: EntryViewModel(data: TDItem.example))
    }
}
