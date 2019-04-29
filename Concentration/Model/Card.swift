//
//  Card.swift
//  Concentration
//
//  Created by Matt Deuschle on 4/28/19.
//  Copyright © 2019 Matt Deuschle. All rights reserved.
//

import Foundation

struct Card {
    var isMatched = false
    var isFlippedUp = false
    var identifier: Int
    private static var indentifierGenerator = 0
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    private static func getUniqueIdentifier() -> Int {
        indentifierGenerator += 1
        return indentifierGenerator
    }
}
