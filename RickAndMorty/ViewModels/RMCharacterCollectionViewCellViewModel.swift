//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Бекжан on 25.03.2023.
//

import Foundation

final class RMCharacterCollectionViewCellViewModel{
    
    public let characterName: String
    public let characterStatus:RMCharacterStatus
    private let characterUmageUrl:URL?
    
    init(
        characterName: String,
        characterStatus: RMCharacterStatus,
        characterUmageUrl: URL?
    ){
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterUmageUrl = characterUmageUrl
    }
    
    public var characterStatusText: String {
        return "Status: \(characterStatus.text )"
    }
    
    public func fetchImage(completion: @escaping(Result<Data, Error>) ->Void ){
        // absract to image manager 
        guard let url = characterUmageUrl else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            
            }
            completion(.success(data))
            
        }
        task.resume()
    }
    
}
