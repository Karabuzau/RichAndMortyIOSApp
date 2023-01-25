//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Бекжан on 25.01.2023.
//

import Foundation

/// Represent unique API endpoint
enum RMEndPoint: String{
    /// Endpoint to get location info
    case location // location as
    /// Endpoint to get character   info
    case character
    /// Endpoint to get episode info
    case episode
}
