//
//  LoadingView.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 4/11/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                ProgressView()
                    .padding(8)
                Text("Fetching your recommendations...")
                Spacer()
                Spacer()
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
