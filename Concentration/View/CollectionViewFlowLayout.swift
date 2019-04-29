//
//  CollectionViewFlowLayout.swift
//  Concentration
//
//  Created by Matt Deuschle on 4/28/19.
//  Copyright © 2019 Matt Deuschle. All rights reserved.
//

import UIKit

class CollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    init(spacing: CGFloat) {
        super.init()
        self.sectionInset = UIEdgeInsets(top: spacing,
                                         left: spacing,
                                         bottom: spacing,
                                         right: spacing)
        self.minimumLineSpacing = spacing
        self.minimumInteritemSpacing = spacing
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
