//
//  MainViewModel.swift
//  Broccoli-Project
//
//  Created by AlecNipp on 3/31/22.
//

import Foundation

/// The main view model of the application. This object is directly observed by the MainView and the ResultsView.
@MainActor class MainViewModel: ObservableObject {
    @Published var recommendationList: [TDItem] = []
    @Published var searchBarContent: String = ""
    @Published var queryList: [TDQuery] = [] // What the user will send to the TD API
    @Published var selectedQueryType: MediaType = .music
    @Published var queryStatus = QueryStatus.idle
    @Published var navLinkIsActive = false
    
    enum QueryStatus {
        case idle
        case loading
        case success
        case failure
    }
    
    func fetchRecommendations() {
        queryStatus = .loading
        Task {
            do {
                recommendationList = try await TasteDiveService.fetchRecommendations(queryItems: queryList)
                print("Done, changing to successful status!")
                queryStatus = .success
            }
            catch {
                print(error.localizedDescription)
                queryStatus = .failure
            }
        }
    }
    func addQueryItem() -> Void {
        if searchBarContent == "" {
            return
        }
        queryList.append(TDQuery(name: searchBarContent, type: selectedQueryType))
        searchBarContent = ""
    }
    
    func removeQueryItem(_ item: TDQuery) {
        let ind = queryList.firstIndex(of: item)!
        queryList.remove(at: ind)
        fetchRecommendations()
    }
}


extension MainViewModel {
    public static var example: MainViewModel {
        let out = MainViewModel()
        out.queryStatus = .success
        out.queryList = [TDQuery.example]
        var exs = [TDItem]()
        for _ in 0...10 {
            exs.append(TDItem.example)
        }
        out.recommendationList = exs
        return out
    }
}
