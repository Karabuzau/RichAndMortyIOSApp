//
//  RMCharacterStatus.swift
//  RickAndMorty
//
//  Created by Бекжан on 27.01.2023.
//

import Foundation

enum RMCharacterStatus: String, Codable {
    //Alive, Dead, Unknown
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown "
}
