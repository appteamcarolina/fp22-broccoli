//
//  QueryItemView.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 4/10/22.
//

import SwiftUI

struct QueryItemView: View {
    let item: TDQuery
    @ObservedObject var vm: MainViewModel
    var body: some View {
        HStack {
            Text(item.name)
            Button {
                vm.removeQueryItem(item)
            } label: {
                Image(systemName: "xmark")
                    .font(.footnote)
            }
            
        }
        .padding(4)
        .background(item.type.getColor())
        .foregroundColor(.white)
        .cornerRadius(3)
        .fixedSize(horizontal: true, vertical: true)
    }
}

//struct QueryItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        QueryItemView(item: TDQuery(name: "Pink Floyd", type: .music), vm:)
//    }
//    struct PreviewWrapper: View {
//        @State(initialValue: MainViewModel.example) var vm: MainViewModel
//
//        var body: some View {
//          SomeView(code: $code)
//        }
//}
//

