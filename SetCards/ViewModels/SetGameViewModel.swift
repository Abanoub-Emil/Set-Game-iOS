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
    var isSelectedBefore = true
    
    func setButtonsImage(_ allCards: [UIButton]) {
        
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
    
    func checkNumberOfSelected(_ allCards: [UIButton]) {
        if (selectedBtnsNames.count == 3){
            
            var selectedGroup = [String]()
            for name in selectedBtnsNames {
                selectedGroup.append(String(name.dropLast()))
            }
            
            if selectedGroup[0] == selectedGroup[1],
                selectedGroup[0] == selectedGroup[2] {
                print("a match")
                
            }
            
            for btn in allCards {
                for name in selectedBtnsNames{
                    if btn.title(for: .normal) == name {
                        btn.layer.borderWidth = 0
                    }
                }
            }
            selectedBtnsNames.removeAll()
        }
    }
    
    func buttonIsSelected(_ button: UIButton) {
        if let btnTitle = button.title(for: .normal){
            
            if selectedBtnsNames.isEmpty{
                appendToSelectedButtons(title: btnTitle, tag: button.tag)
                return
            }
            
            for btn in selectedBtnsNames{
                if btnTitle == btn{
                    isSelectedBefore = true
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
        
        if (!isSelectedBefore){
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.blue.cgColor
        } else {
            button.layer.borderWidth = 0
        }
    }
}
