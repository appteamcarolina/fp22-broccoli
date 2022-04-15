//
//  NoResultsView.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 4/14/22.
//

import SwiftUI

struct NoResultsView: View {
    var body: some View {
        VStack{
            Image(systemName: "questionmark.diamond")
                .font(.largeTitle)
                .padding(5)
            Text("No recommendations were found based on your searches. Try checking the spelling/type of each query item.")
                .multilineTextAlignment(.center)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 2))
    }
}

struct NoResultsView_Previews: PreviewProvider {
    static var previews: some View {
        NoResultsView()
    }
}
