//
//  SetGameViewModel.swift
//  SetCards
//
//  Created by Abanoub on 8/19/18.
//  Copyright © 2018 Abanoub. All rights reserved.
//

import Foundation
import UIKit

class SetGameViewModel: SetGameProtocol {
    
    var playingCards = PlayingCards()
    var selectedBtnsNames = [NSAttributedString]()
    var selectedBtnsTags = [Int]()
    var isSelectedBefore = false
    
    func setButtonsImage(_ allCards: [UIButton]) {
        playingCards = PlayingCards()
        let lastIndex = UInt32(playingCards.primaryCards.count)/4
        for index in 0..<12 {
            let rand = Int(arc4random_uniform(lastIndex))
            let btnImageName = playingCards.primaryCards.remove(at: rand)
            allCards[index].setAttributedTitle(btnImageName, for: .normal)
            
        }
    }
    
    func checkNumberOfSelected(_ allCards: [UIButton]) -> Bool? {
        
        if playingCards.cardValue[selectedBtnsNames[0]]!  == playingCards.cardValue[selectedBtnsNames[1]]!,
                playingCards.cardValue[selectedBtnsNames[0]]! == playingCards.cardValue[selectedBtnsNames[2]]! {
                print("a match")
                replaceSuccessfulMatchCards(allCards)
                return true
            }
            
           setSelectionToNone(allCards)
            return false
        
    }
    
    func setSelectionToNone(_ allCards: [UIButton]) {
        for btn in allCards {
            for name in selectedBtnsNames{
                if btn.attributedTitle(for: .normal) == name || btn.attributedTitle(for: .normal) == nil  {
                    btn.removeButtonBorder()
                }
            }
        }
        selectedBtnsNames.removeAll()
    }
    
    func replaceSuccessfulMatchCards(_ allCards: [UIButton]) {
        if playingCards.primaryCards.isEmpty {
            hideButtons(allCards)
            return
        }
            for btn in allCards {
                for name in self.selectedBtnsNames {
                    if btn.attributedTitle(for: .normal) == name {
                        btn.removeButtonBorder()
                        let lastIndex = UInt32(playingCards.primaryCards.count)/4
                        let rand = Int(arc4random_uniform(lastIndex))
                        let btnImageName = self.playingCards.primaryCards.remove(at: rand)
                        btn.setAttributedTitle(btnImageName, for: .normal)
                    }
                }
            }
        
        selectedBtnsNames.removeAll()
    }
    
    func hideButtons(_ allCards: [UIButton]) {
            for btn in allCards {
                for name in self.selectedBtnsNames{
                    if btn.attributedTitle(for: .normal) == name {
                        btn.setAttributedTitle(nil, for: .normal)
                    }
                }
            }
        setSelectionToNone(allCards)
    }
    
    func buttonIsSelected(_ button: UIButton) {
        if let btnTitle = button.attributedTitle(for: .normal) {
            
                if button.attributedTitle(for: .normal) == nil {
                    return
                }
            
            if selectedBtnsNames.isEmpty {
                appendToSelectedButtons(title: btnTitle, tag: button.tag)
                return
            }
            
            for index in 0..<selectedBtnsNames.count {
                if btnTitle == selectedBtnsNames[index]{
                    isSelectedBefore = true
                    selectedBtnsNames.remove(at: index)
                    break
                } else {
                    isSelectedBefore = false
                }
            }
            
            if !isSelectedBefore {
                appendToSelectedButtons(title: btnTitle, tag: button.tag)
            }
            
        }
    }
    
    func appendToSelectedButtons(title: NSAttributedString, tag: Int) {
        isSelectedBefore = false
        selectedBtnsNames.append(title)
        selectedBtnsTags.append(tag)
    }
    
    func changeButtonTintColor(_ button: UIButton) {
        
        if button.attributedTitle(for: .normal) == nil {
            return
        }
        
        if (!isSelectedBefore) {
            button.addBottomBorderWithColor(width: 1.0)
        } else {
            button.removeButtonBorder()
        }
    }
    
    func addThreeCardsTo(_ allCards: [UIButton]) {
        var numOfAddedCards = 0
        for btn in allCards {
            if btn.attributedTitle(for: .normal)?.string == " " {
                let lastIndex = UInt32(self.playingCards.primaryCards.count)/4
                let rand = Int(arc4random_uniform(lastIndex))
                let btnImageName = self.playingCards.primaryCards.remove(at: rand)
                btn.setAttributedTitle(btnImageName, for: .normal)
                numOfAddedCards += 1
            }
            
            if numOfAddedCards == 3 {
                break
            }
        }
        
    }
  
}
