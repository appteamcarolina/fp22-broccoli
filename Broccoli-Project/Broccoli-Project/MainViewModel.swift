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
    @Published var queryList: [TDQuery] = [] // What the user will send to the TD API
    @Published var selectedQueryType: MediaType = .band
    @Published var queryStatus = QueryStatus.idle
    
    enum QueryStatus {
        case idle
        case loading
        case success
        case failure
    }
    
}


