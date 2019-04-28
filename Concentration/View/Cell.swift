//
//  Cell.swift
//  Concentration
//
//  Created by Matt Deuschle on 4/28/19.
//  Copyright © 2019 Matt Deuschle. All rights reserved.
//

import UIKit

class Cell: UICollectionViewCell {
    
    @IBOutlet var button: UIButton!
    
    static let reuseIdentifier = "Cell"
    
    func configure(with string: String) {
        button.setTitle(string, for: .normal)
    }
}
