//
//  Heroe.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 13/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import Foundation

struct Hero: Codable {
    let id: Int?
    let name: String?
    let description: String?
    let thumbnail: ThumbnailImage?
    //items
    let comics: [Resources]
    let series: [Resources]
    let stories: [Resources]
    let events: [Resources]
}

struct ThumbnailImage: Codable {
    let path: String?
    let thumbnailExtension: String?
}

struct Resources: Codable {
    let resourceURI: String?
    let name: String?
}
