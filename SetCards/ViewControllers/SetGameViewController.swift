//
//  SetGameViewController.swift
//  SetCards
//
//  Created by Abanoub on 8/19/18.
//  Copyright © 2018 Abanoub. All rights reserved.
//

import UIKit

class SetGameViewController: UIViewController {
    
    
    let alertTitle = "Set Game"
    let alertMessage = "Congratulations you have won the game"
    let alertOkButtonText = "Restart"
    var hiddenRows = [UIStackView]()
    @IBOutlet var allCards: [UIButton]!
    
    @IBOutlet weak var deal3CardsButton: UIButton!
    @IBOutlet var hiddenStacks: [UIStackView]!
    
    let setGameViewModel = SetGameViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGameViewModel.setButtonsImage(allCards)
        hiddenRows = hiddenStacks
        
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    @IBAction func cardClicked(_ sender: UIButton) {
        
        setGameViewModel.buttonIsSelected(sender)
        setGameViewModel.changeButtonTintColor(sender)
        setGameViewModel.checkNumberOfSelected(allCards)
        
        if setGameViewModel.playingCards.secondryImagesNames.isEmpty {
            checkIfGameHasFinished()
            deal3CardsButton.isEnabled = false
        }
    }
    
    
    @IBAction func dealThreeMoreCards(_ sender: UIButton) {
        
        let newStack = hiddenRows.removeFirst()
        newStack.isHidden = false
        setGameViewModel.addThreeCardsTo(allCards)
        
        if setGameViewModel.playingCards.secondryImagesNames.isEmpty {
            deal3CardsButton.isEnabled = false
        }
        
    }
    
    
    func checkIfGameHasFinished() {
        for card in allCards {
            if card.currentImage != nil{
                return
            }
            
        }
        
        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        //We add buttons to the alert controller by creating UIAlertActions:
        //            let actionOk = UIAlertAction(title: alertOkButtonText,
        //                                         style: .default,
        //                                         handler: nil)
        let actionOk = UIAlertAction(title: alertOkButtonText, style: .default) { (UIAlertAction) in
            self.resetDashboard()
        }
        alertController.addAction(actionOk)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func resetDashboard() {
        for card in self.allCards {
            card.setTitle("", for: .normal)
        }
        self.setGameViewModel.setButtonsImage(self.allCards)
        for stack in self.hiddenStacks {
            stack.isHidden = true
        }
        self.hiddenRows = self.hiddenStacks
        self.deal3CardsButton.isEnabled = true
    }
    
}

