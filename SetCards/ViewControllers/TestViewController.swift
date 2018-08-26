//
//  TestViewController.swift
//  SetCards
//
//  Created by Abanoub on 8/26/18.
//  Copyright © 2018 Abanoub. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    var newMutableString = NSMutableAttributedString()
    override func viewDidLoad() {
        super.viewDidLoad()

        let playingCards = PlayingCards()
        for card in playingCards.primaryCards! {
            newMutableString.append(card)
        }
        textView.attributedText = newMutableString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
