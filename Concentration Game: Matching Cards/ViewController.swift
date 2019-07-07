//
//  ViewController.swift
//  Concentration Game: Matching Cards
//
//  Created by Devin Reeh on 7/3/19.
//  Copyright © 2019 letsgetgoaling. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Lazy means that the var isn't initialized until someone tries to use game
    // Lazy vars cannot have a propertyObservers ( i.e. didSet ) unfortunately
    
    lazy var game: Concentration = Concentration(numberOfPairsOfCards: (cardButtons.count+1)/2)
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips \(flipCount)"
        }
    }

    var emojiChoices = ["😵", "😈", "🤮", "😻", "🎃", "👍🏽", "🤬", "😬",
                        "😇", "😎", "🤩", "😔", "☺️", "💩", "👾", "🐨",]
    
    var emoji = [Int: String]()
    
    @IBAction func touchNewGame(_ sender: UIButton, forEvent event: UIEvent) {
        game.restart()
        updateViewFromModel()
    }
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber) // let model to choose card
            updateViewFromModel()
        } else {
            print("No valid index for emojis array")
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? .clear : .orange
            }
        }
    }
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = arc4random_uniform(UInt32(emojiChoices.count))
            emoji[card.identifier] = emojiChoices.remove(at: Int(randomIndex))
        }
        
        return emoji[card.identifier] ?? "?"
    }

}

