//
//  Card.swift
//  Concentration
//
//  Created by Matt Deuschle on 4/28/19.
//  Copyright © 2019 Matt Deuschle. All rights reserved.
//

import Foundation

struct Card: Hashable {
    
    var isMatched = false
    var isFaceUp = false
    var identifier: Int
    private static var indentifierGenerator = 0
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    private static func getUniqueIdentifier() -> Int {
        indentifierGenerator += 1
        return indentifierGenerator
    }
}
