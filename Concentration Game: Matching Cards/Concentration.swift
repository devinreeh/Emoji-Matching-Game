//
//  Concentration.swift
//  Concentration Game: Matching Cards
//
//  Created by Devin Reeh on 7/4/19.
//  Copyright © 2019 letsgetgoaling. All rights reserved.
//

import Foundation

class Concentration
{
//    API - Application Programming Interface
//    * a list of all methods and instance variables in that class
//    * public API are all of the methods that you are going to allow other classes to call we're going to design our public API **
    
    var cards = [Card]() // open parentheses correpsonds to array initialzer -> it creates an empty array
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        // ignore cards that are matched
        if !cards[index].isMatched {
            // Case 1: No cards are face up, then flip over selected card
            // Case 2: Two cards are face up, then flip both face down
            // Case 3: One cards are face up
            
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
        
    }
    
    func restart() {
        var cardIndex = 0
        while cardIndex <= cards.count-1 {
            let card = Card()
            cards[cardIndex...cardIndex+1] = [card, card]
            cardIndex += 2
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            // let matchingCard = card
            // when you assign a struct to another variable it makes a copy
            // of that struct
            // cards.append(card)
            // cards.append(card)
            cards += [card, card]
        }
        
        // Shuffle the cards
        cards.shuffle()
    }
}
