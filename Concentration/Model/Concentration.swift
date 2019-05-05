//
//  Concentration.swift
//  Concentration
//
//  Created by Matt Deuschle on 4/28/19.
//  Copyright © 2019 Matt Deuschle. All rights reserved.
//

import Foundation

struct Concentration {
    
    private(set) var cards = [Card]()
    private(set) var score = 0
    private(set) var flipCount = 0
    private var selectedIndices = Set<Int>()
    private var lastIndexWasSelected = false
    var indexOfOneAndOnlyFaceUp: Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    // returns true is all cards have been matched
    var allCardsHaveBeenMatched: Bool {
        for index in cards.indices {
            if !cards[index].isMatched { return false }
        }
        return true
    }
    
    mutating func shuffle() {
        
    }
    
    
    
    mutating func chooseCard(at index: Int) {
        let cardWasPreviouslySelected = selectedIndices.contains(index)
        if !cards[index].isMatched {
            // only flip cards visible
            flipCount += 1
            if let matchedIndex = indexOfOneAndOnlyFaceUp, matchedIndex != index {
                // 2 cards are face up, check if cards match
                if cards[index] == cards[matchedIndex] {
                    cards[index].isMatched = true
                    cards[matchedIndex].isMatched = true
                    if lastIndexWasSelected {
                        // add extra from subtraction before
                        score += 3
                    } else {
                        score += 2
                    }
                } else {
                    // no match
                    if cardWasPreviouslySelected {
                        score -= 1
                    }
                }
                cards[index].isFaceUp = true
            } else {
                // one card selected, turn down other cards and set this card
                if cardWasPreviouslySelected {
                    score -= 1
                }
                indexOfOneAndOnlyFaceUp = index
                lastIndexWasSelected = cardWasPreviouslySelected
            }
        }
        selectedIndices.insert(index)
    }
}
