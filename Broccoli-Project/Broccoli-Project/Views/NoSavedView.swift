//
//  NoSavedView.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 4/19/22.
//

import SwiftUI

import SwiftUI

struct NoSavedView: View {
    var body: some View {
        VStack{
            Image(systemName: "bookmark")
                .font(.largeTitle)
                .padding(5)
            Text("You have no items saved yet. Click the bookmark icon on an entry in order to add it to your Saved list.")
                .multilineTextAlignment(.center)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 2))
    }
}

struct NoSavedView_Previews: PreviewProvider {
    static var previews: some View {
        NoSavedView()
    }
}
