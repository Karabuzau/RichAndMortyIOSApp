//
//  RMService.swift
//  RickAndMorty
//
//  Created by Бекжан on 25.01.2023.
//

import Foundation

/// Primary API service object to get Rick and Morty data
final class RMService{
    /// sshared singleton instance
    static let shared = RMService()
    
    /// Privitaze constractor
    private init(){}
    cd ..
    /// Send Rick and morty API call
    /// - Parameters:
    ///   - request: request instance
    ///   - completion: Callback with data ot error
    public func execute(_ request: RMRequest, completion:@escaping()-> Void) {
        
    }
}
