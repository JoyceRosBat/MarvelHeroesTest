//
//  Heroe.swift
//  marvelheroes
//
//  Created by Joyce Rosario Batista on 13/11/2020.
//  Copyright © 2020 Joyce Rosario Batista. All rights reserved.
//

import Foundation

struct HeroData: Codable {
    let data: HeroResult?
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decode(HeroResult.self, forKey: .data)
    }
}

struct HeroResult: Codable {
    let results: [Hero]?
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        results = try container.decode([Hero].self, forKey: .results)
    }
}

struct Hero: Codable {
    let id: Int?
    let name: String?
    let description: String?
    let thumbnail: ThumbnailImage?
    let comics: Item?
    let series: Item?
    let stories: Item?
    let events: Item?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case thumbnail
        case comics
        case series
        case stories
        case events
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        thumbnail = try container.decodeIfPresent(ThumbnailImage.self, forKey: .thumbnail)
        comics = try container.decodeIfPresent(Item.self, forKey: .comics)
        series = try container.decodeIfPresent(Item.self, forKey: .series)
        stories = try container.decodeIfPresent(Item.self, forKey: .stories)
        events = try container.decodeIfPresent(Item.self, forKey: .events)
    }
}

struct ThumbnailImage: Codable {
    let path: String?
    let thumbnailExtension: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        path = try container.decodeIfPresent(String.self, forKey: .path)
        thumbnailExtension = try container.decodeIfPresent(String.self, forKey: .thumbnailExtension)
    }
}

struct Item: Codable {
    let item: [Resources]?
    
    enum CodingKeys: String, CodingKey {
        case item = "items"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        item = try container.decodeIfPresent([Resources].self, forKey: .item)
    }
}

struct Resources: Codable {
    let resourceURI: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case resourceURI
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        resourceURI = try container.decodeIfPresent(String.self, forKey: .resourceURI)
        name = try container.decodeIfPresent(String.self, forKey: .name)
    }
}
