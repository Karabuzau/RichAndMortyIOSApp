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
    private let endPiont:RMEndPoint
    
    private let  pathhComponens: Set<String>
    
    private let queryParameters: [URLQueryItem]
    
    init(endPiont: RMEndPoint,
         pathhComponens: Set<String> = [],
         queryParameters: [URLQueryItem] = []
    ) {
        self.endPiont = endPiont
        self.pathhComponens = pathhComponens
        self.queryParameters = queryParameters
    }
    
    private var urlString: String{
        var string = Constants.baseUrl
        string += "/"
        string += endPiont.rawValue
        
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
        }
     
        
        return string
    }
    
    /// Computed and constructed API
    public var url:URL? {
        return URL(string: urlString)
    }
    
    public let HTTPmethod = "GET"
}
