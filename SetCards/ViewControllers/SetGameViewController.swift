//
//  SetGameViewController.swift
//  SetCards
//
//  Created by Abanoub on 8/19/18.
//  Copyright © 2018 Abanoub. All rights reserved.
//

import UIKit

class SetGameViewController: UIViewController {
    
    @IBOutlet var allCards: [UIButton]!
    
    
    let setGameViewModel = SetGameViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGameViewModel.setButtonsImage(allCards)

        
        
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
  

}

