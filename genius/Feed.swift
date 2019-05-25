//
//  Feed.swift
//  genius
//
//  Created by Nick on 5/19/19.
//  Copyright © 2019 nicksdev. All rights reserved.
//

import Foundation

struct Feed: Decodable {
    var results: [Results]
    
}

struct SubData: Decodable{
    var feed: Feed
    
}

struct Results: Decodable{
    let artistName: String
    let releaseDate: String
    let artworkUrl100: String
    
}

