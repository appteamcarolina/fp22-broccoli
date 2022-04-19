//
//  NoImageAvailable.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 4/18/22.
//

import SwiftUI

struct NoImageAvailableView: View {
    var body: some View {
        Image(systemName: "questionmark")
            .resizable()
            .scaledToFit()
            .padding(15)
    }
}

struct NoImageAvailableView_Previews: PreviewProvider {
    static var previews: some View {
        NoImageAvailableView()
    }
}
