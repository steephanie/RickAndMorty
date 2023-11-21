//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Stephanie on 22/10/23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}


