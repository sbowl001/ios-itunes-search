//
//  SearchResult.swift
//  Itunes Search
//
//  Created by Stephanie Bowles on 5/28/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import Foundation

struct SearchResult: Codable {
  
    let title : String?
    let creator : String?
    
    
    enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case creator = "artistName"
    }
}



struct SearchResults: Decodable {
    let results: [SearchResult]
}
