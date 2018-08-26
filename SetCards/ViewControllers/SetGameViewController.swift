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
    @IBOutlet var allCards: [UIButton]!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var deal3CardsButton: UIButton!
    @IBOutlet var hiddenStacks: [UIStackView]!
    
    let setGameViewModel = SetGameViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGameViewModel.setButtonsImage(allCards)
        hiddenRows = hiddenStacks
        
        setGameViewModel.longAction(attr: "kl") {
            print("lk")
        }
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
        if setGameViewModel.playingCards.secondryImagesNames.isEmpty {
            checkIfGameHasFinished()
            deal3CardsButton.isEnabled = false
        }
        scoreLabel.text = String(score)
        
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
            card.setTitle("", for: .normal)
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
    
}

