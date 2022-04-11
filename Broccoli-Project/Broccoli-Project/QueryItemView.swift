//
//  QueryItemView.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 4/10/22.
//

import SwiftUI

struct QueryItemView: View {
    let item: TDQuery
    var body: some View {
        HStack {
            Text(item.name)
            Divider()
            Text(item.type.toString())
        }
        .font(.system(size: 10))
        .padding(2)
        .background(item.type.getColor())
        .foregroundColor(.white)
        .cornerRadius(3)
        .frame(height: 15)
        .fixedSize(horizontal: true, vertical: true)
    }
}

struct QueryItemView_Previews: PreviewProvider {
    static var previews: some View {
        QueryItemView(item: TDQuery(name: "Pink Floyd", type: .band))
    }
}
