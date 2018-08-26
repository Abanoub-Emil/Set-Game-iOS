//
//  SetGameProtocol.swift
//  SetCards
//
//  Created by Abanoub on 8/26/18.
//  Copyright © 2018 Abanoub. All rights reserved.
//

import Foundation
import UIKit

protocol SetGameProtocol {
    
    func setButtonsImage(_ allCards: [UIButton])
    
    func checkNumberOfSelected(_ allCards: [UIButton]) -> Bool?
    
    func setSelectinToNone(_ allCards: [UIButton])
    
    func replaceSuccessfulMatchCards(_ allCards: [UIButton])
    
    func hideButtons(_ allCards: [UIButton])
    
    func buttonIsSelected(_ button: UIButton)
    
    func appendToSelectedButtons(title: String, tag: Int)
    
    func changeButtonTintColor(_ button: UIButton)
    
    func addThreeCardsTo(_ allCards: [UIButton])
    
}
