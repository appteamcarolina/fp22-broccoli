//
//  MainViewModel.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 3/31/22.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var recommendationList: [TDItem] = []
    @Published var searchBarContent: String = ""
    @Published var queryList: [TDItem] = [] // What the user will send to the TD API
}
