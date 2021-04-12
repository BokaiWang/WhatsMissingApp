//
//  CardCollectionViewCell.swift
//  What'sMissing
//
//  Created by 王柏凱 on 2020/11/17.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var frontImageView: UIImageView!
    
    @IBOutlet weak var backImageView: UIImageView!
    
    var card:Card?
    
    func configureCell(card:Card){
        
        // Keep track of the card this cell represents
        self.card = card
        
        // Set the front image view
        frontImageView.image = UIImage(named: card.imageName)
        
        // Reset the cell
        if card.isFlipped == true {
            // Show the front image
            flipUp(speed: 0)
        }
        else {
            // Show the back image
            flipDown(speed: 0, delay: 0)
        }
        
        
    }
    
    func flipUp(speed:TimeInterval = 0.3) {
        UIView.transition(from: backImageView, to: frontImageView, duration: speed, options: [.transitionFlipFromLeft,.showHideTransitionViews], completion: nil)
        
        card?.isFlipped = true
    }
    
    func flipDown(speed:TimeInterval = 0.3, delay:TimeInterval = 0.5) {
        
        // Delay the animation
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {
            
            UIView.transition(from: self.frontImageView, to: self.backImageView, duration: speed, options: [.transitionFlipFromLeft,.showHideTransitionViews], completion: nil)
        }
        
        card?.isFlipped = false
        
    }
    
}
