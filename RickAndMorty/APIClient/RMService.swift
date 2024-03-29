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
    
    enum RMServiceError:Error {
    case  failedToCreaterequest
    case failedToGetData
    }
    /// Send Rick and morty API call
    /// - Parameters:
    ///   - request: request instance
    ///   - completion: Callback with data ot error
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping(Result <T, Error>)-> Void
    ) {
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCreaterequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
        
    }
    //MARK:-Private
    private func request(from rmRequest:RMRequest) ->URLRequest?{
        guard let url = rmRequest.url else {return nil}
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.HTTPmethod
        return request
        
    }
}
