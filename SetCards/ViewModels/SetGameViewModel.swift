//
//  SetGameViewModel.swift
//  SetCards
//
//  Created by Abanoub on 8/19/18.
//  Copyright © 2018 Abanoub. All rights reserved.
//

import Foundation
import UIKit

class SetGameViewModel {
    
    var playingCards = PlayingCards()
    var selectedBtns = ["", " ", "  "]
    var isSelected = false
    
    func setButtonsImage(_ allCards:[UIButton]){
        
        for index in 0..<allCards.count {
            let rand = Int(arc4random_uniform(UInt32(playingCards.allImagesNames.count)))
            let btnImageName = playingCards.allImagesNames.remove(at: rand)
            allCards[index].setImage(UIImage(named: btnImageName), for: .normal)
            let btnTitle =  String(btnImageName.dropLast())
            allCards[index].setTitle(btnTitle, for: .normal)
            print(allCards[index].title(for: .normal)!)
            
            if index == allCards.count-1{
                break
            }
        }
        
    }
}
