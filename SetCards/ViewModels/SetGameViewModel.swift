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
    var selectedBtnsNames = [String]()
    var selectedBtnsTags = [Int]()
    var isSelectedBefore = false
    
    func setButtonsImage(_ allCards: [UIButton]) {
        playingCards = PlayingCards()
        for index in 0..<playingCards.primaryImagesNames.count {
            let rand = Int(arc4random_uniform(UInt32(playingCards.primaryImagesNames.count)))
            let btnImageName = playingCards.primaryImagesNames.remove(at: rand)
            allCards[index].setImage(UIImage(named: btnImageName), for: .normal)
            allCards[index].setTitle(btnImageName, for: .normal)
            print(allCards[index].title(for: .normal)!)
            
            if index == allCards.count-1{
                break
            }
        }
    }
    
    func checkNumberOfSelected(_ allCards: [UIButton]) -> Bool? {
        
            
            var selectedGroup = [String]()
            for name in selectedBtnsNames {
                selectedGroup.append(String(name.dropLast()))
            }
            
            if selectedGroup[0] == selectedGroup[1],
                selectedGroup[0] == selectedGroup[2] {
                print("a match")
                replaceSuccessfulMatchCards(allCards)
                return true
            }
            
           setSelectinToNone(allCards)
            return false
        
    }
    
    func setSelectinToNone(_ allCards: [UIButton]) {
        for btn in allCards {
            for name in selectedBtnsNames{
                if btn.title(for: .normal) == name {
                    btn.layer.borderWidth = 0
                }
            }
        }
        selectedBtnsNames.removeAll()
    }
    
    func replaceSuccessfulMatchCards(_ allCards: [UIButton]) {
        if playingCards.secondryImagesNames.isEmpty {
            hideButtons(allCards)
            return
        }
            for btn in allCards {
                for name in self.selectedBtnsNames{
                    if btn.title(for: .normal) == name {
                        btn.layer.borderWidth = 0
                        let rand = Int(arc4random_uniform(UInt32(self.playingCards.secondryImagesNames.count)))
                        let btnImageName = self.playingCards.secondryImagesNames.remove(at: rand)
                        btn.setImage(UIImage(named: btnImageName), for: .normal)
                        btn.setTitle(btnImageName, for: .normal)
                    }
                }
            }
        
        selectedBtnsNames.removeAll()
    }
    
    func hideButtons(_ allCards: [UIButton]) {
            for btn in allCards {
                for name in self.selectedBtnsNames{
                    if btn.title(for: .normal) == name {
                        btn.setImage(nil, for: .normal)
                    }
                }
            }
        setSelectinToNone(allCards)
    }
    
    func buttonIsSelected(_ button: UIButton) {
        if let btnTitle = button.title(for: .normal) {
            
                if button.currentImage == nil {
                    return
                }
            
            if selectedBtnsNames.isEmpty {
                appendToSelectedButtons(title: btnTitle, tag: button.tag)
                return
            }
            
            for index in 0..<selectedBtnsNames.count{
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
    
    func appendToSelectedButtons(title: String, tag: Int) {
        isSelectedBefore = false
        selectedBtnsNames.append(title)
        selectedBtnsTags.append(tag)
    }
    
    func changeButtonTintColor(_ button: UIButton) {
        
        if button.currentImage == nil {
            return
        }
        
        if (!isSelectedBefore){
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.blue.cgColor
        } else {
            button.layer.borderWidth = 0
        }
    }
    
    func addThreeCardsTo(_ allCards: [UIButton]) {
        var numOfAddedCards = 0
        for btn in allCards {
            if btn.currentImage == nil {
                let rand = Int(arc4random_uniform(UInt32(self.playingCards.secondryImagesNames.count)))
                let btnImageName = self.playingCards.secondryImagesNames.remove(at: rand)
                btn.setImage(UIImage(named: btnImageName), for: .normal)
                btn.setTitle(btnImageName, for: .normal)
                numOfAddedCards += 1
            }
            
            if numOfAddedCards == 3 {
                break
            }
        }
        
    }
    
    
}
