//
//  GetCharectersResponce.swift
//  RickAndMorty
//
//  Created by Бекжан on 22.03.2023.
//

import Foundation
 
struct RMGetCharectersResponce: Codable{
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
        
        
    }
    let info: Info
    let results:[RMCharacters]
}

