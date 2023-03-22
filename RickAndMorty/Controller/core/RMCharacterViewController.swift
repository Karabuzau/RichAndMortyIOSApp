//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Бекжан on 07.01.2023.
//

import UIKit

/// Controller to show and serach for character
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Character"
        let request = RMRequest(
            endPiont: .character,
            pathhComponens: ["1"]
        )
        print(request.url)


    }
    

 

}
