//
//  CardDeck.swift
//  What'sMissing
//
//  Created by 王柏凱 on 2020/11/17.
//

import Foundation

class CardDeck {
    var halfCards = [Card]()
    
    func getCards() -> [Card] {
        
        // Declare an empty array to store all the cards
        var generatedCards = [Card]()
        var generatedNumbers = [Int]()
        
        
        // Randomly generate 8 pairs of cards
        while generatedCards.count < 16 {
            let randomNumber = Int.random(in: 1...13)
            
            if generatedNumbers.contains(randomNumber) == false {
                
                // Create card objects
                let cardOne = Card()
                let cardTwo = Card()
                
                cardOne.imageName = "card\(randomNumber)"
                cardTwo.imageName = "card\(randomNumber)"
                
                generatedCards += [cardOne, cardTwo]
                halfCards += [cardOne]
                
                
                // Track the integers
                generatedNumbers.append(randomNumber)
                
            }
            
        }
            
        // Randomize the array
        generatedCards.shuffle()
        
        // Return the array
        return generatedCards
    }
}
