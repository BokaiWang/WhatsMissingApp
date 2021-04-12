//
//  ViewController.swift
//  What'sMissing
//
//  Created by 王柏凱 on 2020/11/17.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBAction func goButton(_ sender: Any) {
        
        performSegue(withIdentifier: "answer", sender: self)
    }
    
    // Pass data to AnswerViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let answerVC = segue.destination as! AnswerViewController
        answerVC.answerCard = missingCard
        answerVC.candidateCards = deck.halfCards
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    let deck = CardDeck()
    var cardsArray = [Card]()
    var missingCard = Card()
    
    
    var firstFlippedCardIndex:IndexPath?
    var secondFlippedCardIndex:IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        cardsArray = deck.getCards()
        missingCard = cardsArray[15]
        
        
        // Set the view controller as the delegate
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    
    
    // MARK: - Collection view delegate methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardsArray.count-1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Get a cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        // Configure the cell
        cell.configureCell(card: cardsArray[indexPath.row])
        
        // Return it
        return cell
    }
    
    // MARK: - Tap the cell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // Get a reference to the cell that was tapped
        let cell = collectionView.cellForItem(at: indexPath) as? CardCollectionViewCell
        
        // Check the status of the card to determine how to flip it
        if cell?.card?.isFlipped == false {
            cell?.flipUp()
            
            if firstFlippedCardIndex == nil {
                firstFlippedCardIndex = indexPath
            }
            else {
                secondFlippedCardIndex = indexPath
                
                if firstFlippedCardIndex != nil && secondFlippedCardIndex != nil {
                    
                    flipBack()
                
                }
                
            }
            
        }
        
    }
    
    func flipBack() {
        let cardOne = cardsArray[firstFlippedCardIndex!.row]
        let cardTwo = cardsArray[secondFlippedCardIndex!.row]
        
        let cardOneCell = collectionView.cellForItem(at: firstFlippedCardIndex!) as? CardCollectionViewCell
        let cardTwoCell = collectionView.cellForItem(at: secondFlippedCardIndex!) as? CardCollectionViewCell
        
        cardOneCell?.flipDown()
        cardTwoCell?.flipDown()
        
        // Reset the status of the cards.
        cardOne.isFlipped = false
        cardTwo.isFlipped = false
        
        firstFlippedCardIndex = nil
        secondFlippedCardIndex = nil
        
        
        
    }

}

