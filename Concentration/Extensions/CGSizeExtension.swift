//
//  CGSizeExtension.swift
//  Concentration
//
//  Created by Matt Deuschle on 4/28/19.
//  Copyright © 2019 Matt Deuschle. All rights reserved.
//

import UIKit

extension UICollectionView {
    func getSizeFor(numberOfItemsPerRow: CGFloat,
                 spacing: CGFloat) -> CGSize {
        let totalSpacing = (2 * spacing) + ((numberOfItemsPerRow - 1) * spacing) //Amount of total spacing in a row
        let width = (self.bounds.width - totalSpacing)/numberOfItemsPerRow
        return CGSize(width: width, height: width)
    }
}
