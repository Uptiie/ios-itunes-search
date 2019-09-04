//
//  SearchResult.swift
//  iTunes Search
//
//  Created by Uptiie on 9/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct SearchResult: Codable {
    
    struct SearchResults {
        let results: [SearchResults]
    }
    
    enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case creator = "artistName"
    }
    
    let title: String
    let creator: String
}
