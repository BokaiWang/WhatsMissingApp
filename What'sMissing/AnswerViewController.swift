//
//  AnswerViewController.swift
//  What'sMissing
//
//  Created by 王柏凱 on 2020/11/24.
//

import UIKit

class AnswerViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var guessCollectionView: UICollectionView!
    
    var guessCard = Card()
    
    var answerCard = Card()
    
    var candidateCards = [Card]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guessCollectionView.dataSource = self
        guessCollectionView.delegate = self
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return candidateCards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let guessCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GuessCell", for: indexPath) as! GuessCollectionViewCell
        
        
        guessCell.configureGuessCell(card: candidateCards[indexPath.row])
        
        
        return guessCell
        
    }
    
    var ishighlighted = false
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        
        let guessCell = collectionView.cellForItem(at: indexPath)
        
        if ishighlighted == false {
            
            guessCell?.contentView.backgroundColor = #colorLiteral(red: 0.9321472645, green: 0, blue: 0, alpha: 1)
            ishighlighted = true
            guessCard = candidateCards[indexPath.row]
            confirm(title: "Confirmation", message: "Are you sure? ")
        
        } else if ishighlighted == true && guessCell?.contentView.backgroundColor == #colorLiteral(red: 0.9321472645, green: 0, blue: 0, alpha: 1){
           
            guessCell!.contentView.backgroundColor = nil
            ishighlighted = false
            
        }
      
    }
    
    // MARK: - Game Logic
    
    func checkForMatch () {
        let cardOne = answerCard
        let cardTwo = guessCard
        
        if cardOne.imageName == cardTwo.imageName {
            showAlert(title: "Congratulations!", message: "You've won the game!")
        }
        else {
            showAlert(title: "Oops...", message: "Better luck next time")
        }
    }
    
    // Create an alert
    // First create a UIAlertController
    // Then create a UIAlertAction
    // Add the UIAlertAction to the UIAlertController
    // Finall call present function to show the alert
    func showAlert(title:String, message:String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    func confirm(title:String, message:String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            self.checkForMatch()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
