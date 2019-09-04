//
//  SearchResultController.swift
//  iTunes Search
//
//  Created by Uptiie on 9/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class SearchResultController {
    
    let baseURL = URL(string: "https://itunes.apple.com/search?parameterkeyvalue")!
    
    var searchResults: [SearchResult] = []
    
    func performSearch(with searchTerm: String, resultType: ResultType, completion: @escaping () -> Void) {
        
        let searchURL = baseURL.appendingPathComponent("search")
        
        var components = URLComponents(url: searchURL, resolvingAgainstBaseURL: true)
        
        let searchItem = URLQueryItem(name: "search", value: searchTerm)
        
        components?.queryItems = [searchItem]
        
        guard let requestURL = components?.url else {
            completion()
            return
        }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod =
        
            URLSession.shared.dataTask(with: request) { (data, _, error) in
                
                if let error = error {
                    NSLog("Error searching for item: \(error), on line \(#line) in \(#file)")
                }
                
                guard let data = data else {
                    NSLog("No data returned from searching for people")
                    completion()
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    
                    let personSearch = try decoder.decode(searchItem.self, from: data)
                }
        }
    }
}
