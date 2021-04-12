//
//  GuessCollectionViewCell.swift
//  What'sMissing
//
//  Created by 王柏凱 on 2020/11/24.
//

import UIKit

class GuessCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var frontImageView:UIImageView!
    
    var card:Card?
    
    func configureGuessCell(card:Card) {
        self.card = card
        frontImageView.image = UIImage(named: card.imageName)
        
    }
    
    
    
}
