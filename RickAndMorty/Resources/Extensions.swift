//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Бекжан on 23.03.2023.
//

import UIKit
extension UIView {
    func addSubviews(_ views:UIView...){
        views.forEach({
            addSubview($0)
        })
    }
}
