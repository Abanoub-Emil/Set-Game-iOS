//
//  SetGameViewController.swift
//  SetCards
//
//  Created by Abanoub on 8/19/18.
//  Copyright © 2018 Abanoub. All rights reserved.
//

import UIKit

class SetGameViewController: UIViewController {
    
    
    var hiddenRows = [UIStackView]()
    var score = 0
    let alertTitle = "Set Game"
    let alertOkButtonText = "New Game"
    let alertCancelButtonText = "Cancel"
    @IBOutlet var allCards: [UIButton]!
    
    @IBOutlet weak var scoreLabel: UILabel!
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
        if (setGameViewModel.selectedBtnsNames.count == 3){
           
           checkSelectedCards()
        }
        if setGameViewModel.playingCards.primaryCards.isEmpty {
            for card in allCards {
                if card.attributedTitle(for: .normal)?.string == " " {
                    card.setAttributedTitle(nil, for: .normal)
                }
            }
            checkIfGameHasFinished()
            deal3CardsButton.isEnabled = false
        }
        scoreLabel.text = String(score)
        
    }
    
    func checkSelectedCards() {
        
        UIView.animate(withDuration: 0.9,
                       delay: 0,
                       options: .transitionCrossDissolve,
                       animations: {
                        let isMatch = self.setGameViewModel.checkNumberOfSelected(self.allCards)
                        if let match = isMatch {
                            if match {
                                self.score += 3
                            } else {
                                self.score -= 7
                            }
                        }
                        self.view.layoutIfNeeded()
        },
                       completion: nil)
    }
    
    @IBAction func dealThreeMoreCards(_ sender: UIButton) {
        
        let newStack = hiddenRows.removeFirst()
        newStack.isHidden = false
        setGameViewModel.addThreeCardsTo(allCards)
        
        if setGameViewModel.playingCards.primaryCards.isEmpty || hiddenRows.isEmpty {
            deal3CardsButton.isEnabled = false
        }
        
    }
    
    
    func checkIfGameHasFinished() {
        
        for card in allCards {
            if card.attributedTitle(for: .normal) != nil{
                return
            }
        }
        
        let alertMessage = "Congratulations you have finished the game with score: \(score)"
        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        
        let actionOk = UIAlertAction(title: alertOkButtonText, style: .default) { (UIAlertAction) in
            self.resetDashboard()
        }
        alertController.addAction(actionOk)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func resetDashboard() {
        for card in self.allCards {
            let attrStr = NSAttributedString(string: " ", attributes: nil)
            card.setAttributedTitle(attrStr, for: .normal)
        }
        self.setGameViewModel.setButtonsImage(self.allCards)
        for stack in self.hiddenStacks {
            stack.isHidden = true
        }
        self.hiddenRows = self.hiddenStacks
        self.deal3CardsButton.isEnabled = true
        score = 0
        scoreLabel.text = String(score)
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        createNewGame()
    }
    
    func createNewGame() {
        let alertMessage = "Do you really want to start a new game?! \n Your progress will be lost!!"
        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        
        let actionOk = UIAlertAction(title: alertOkButtonText, style: .default) { (UIAlertAction) in
            self.resetDashboard()
        }
        let actionCancel = UIAlertAction(title: alertCancelButtonText, style: .cancel) { (UIAlertAction) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(actionOk)
        alertController.addAction(actionCancel)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

