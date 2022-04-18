//
//  WatchListDetailView.swift
//  Broccoli-Project
//
//  Created by peter wi on 4/17/22.
//

import SwiftUI

struct WatchListDetailView: View {
    let entry: EntryModel
    @ObservedObject var vm: WatchlistViewModel
    @State var teaserIsCollapsed = true
    @State var teaserLineLimit: Int? = 10
    @State var isInWatchlist = true
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .leading) {
                    AsyncImage(url: URL(string: vm.curImageUrl ?? "")) { phase in
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
                    
                    
                    VStack(alignment: .leading) {
                        Text(vm.curName ?? "")
                            .font(.custom("Times", size: 34, relativeTo: .title))
                            .foregroundColor(.primary)
                            .italic()
                            .bold()
                        HStack {
                            Text(vm.curType ?? "")
                                .foregroundColor(.secondary)
                            Spacer()
                            Button {
                                if !(isInWatchlist) {
                                    vm.addToWatchlist()
                                    isInWatchlist = true
                                } else {
                                    vm.deleteFromWatchList()
                                    isInWatchlist = false
                                }
                            } label: {
                                Image(systemName: isInWatchlist ? "star.fill" : "star")
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
                                Text(vm.curWTeaser ?? "")
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
        .onAppear {
            vm.updateCurEntry(entry: entry)
        }
    }
}
//
//struct WatchListDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        WatchListDetailView(entry: <#T##EntryData#>, vm: <#T##WatchlistViewModel#>)
//
//    }
//}
