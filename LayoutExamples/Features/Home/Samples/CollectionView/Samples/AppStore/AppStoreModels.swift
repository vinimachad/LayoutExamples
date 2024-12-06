//
//  AppStoreModels.swift
//  LayoutExamples
//
//  Created by Vinicius Galhardo Machado on 03/07/24.
//

import Foundation

enum AppStoreModels {
    
    struct Section: Decodable, Hashable {
        var type: Section.Kind
        var title: String
        var subtitle: String
        var items: [Item]
        
        enum Kind: String, Decodable {
            case feature = "featured"
//            case carousel = "CAROUSEL"
            case mediumList = "mediumTable"
            case smallList = "smallTable"
        }
        
        struct Item: Decodable, Hashable {
            var tag: String
            var name: String
            var subheading: String
            var image: String
            
            enum CodingKeys: String, CodingKey {
                case tag = "tagline"
                case name = "name"
                case subheading = "subheading"
                case image = "image"
            }
        }
    }
}
