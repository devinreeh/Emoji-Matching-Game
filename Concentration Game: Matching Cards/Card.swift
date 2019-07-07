//
//  Card.swift
//  Concentration Game: Matching Cards
//
//  Created by Devin Reeh on 7/4/19.
//  Copyright © 2019 letsgetgoaling. All rights reserved.
//

import Foundation
// In swift, structs are very similar to classes except
// 1.) structs have no inheritance (makes it simpler)
// 2.) structs are value types, classes are reference types
// value type, when you pass it as an argument or assign it to another variable it gets copied
// ** arrays, ints, strings, and dictionaries are structs **
// ** it's not inefficient because Swift only makes a copy when someone
//    modifies it ( called copy on write semantics )**
//
// ** reference type, the thing lives in the heap, you've got pointers to it, when you pass it around
//    you're just passing pointers to it **

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    // doesn't need the emoji because this is a part of the model and the model is UI independent
    // this Card struct just defines the behavior of the Card not what is being displayed on the card
    
    // static means that even though this method is in Card
    // you can't send it to a card ( a card doesn't understand it )
    // but the type card understand this message ** global function utility function tied to the type **
    
    static var identifierFactory = 0
    
    
    static func getUniqueIdentifer() -> Int {
        // in static method you can access static vars so you
        // don't have to write Card.identifierFactory
        identifierFactory += 1
        
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifer()
        // self means this cards identifier
    }
}
