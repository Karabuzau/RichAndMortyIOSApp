//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Бекжан on 25.01.2023.
//

import Foundation

///
final class RMRequest {
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    private let endPoint:RMEndPoint
    
    private let  pathhComponens: [String]
    
    private let queryParameters: [URLQueryItem]
    
    private var urlString: String{
        var string = Constants.baseUrl
        string += "/"
        string += endPoint.rawValue
        
        if !pathhComponens.isEmpty {
            pathhComponens.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentSrring = queryParameters.compactMap({
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentSrring
        }
     
        return string
    }
    
    /// Computed and constructed API
    public var url:URL? {
        return URL(string: urlString)
    }
    
    public let HTTPmethod = "GET"
    
    public init(endPoint: RMEndPoint,
         pathhComponens: [String] = [],
         queryParameters: [URLQueryItem] = []
    ) {
        self.endPoint = endPoint
        self.pathhComponens = pathhComponens
        self.queryParameters = queryParameters
    }
}


extension RMRequest {
    static let listChatacterRequest = RMRequest(endPoint: .character)}
