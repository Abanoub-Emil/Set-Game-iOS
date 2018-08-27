//
//  PlayingCards.swift
//  SetCards
//
//  Created by Abanoub on 8/19/18.
//  Copyright © 2018 Abanoub. All rights reserved.
//

import Foundation
import UIKit

struct PlayingCards {
    
    var tri1 = Shapes.oneTriangle.rawValue
    var tri2 = Shapes.twoTriangles.rawValue
    var tri3 = Shapes.threeTriangles.rawValue
    
    var squr1 = Shapes.oneSquare.rawValue
    var squr2 = Shapes.twoSquares.rawValue
    var squr3 = Shapes.threeSquares.rawValue
    
    var circ1 = Shapes.oneCircle.rawValue
    var circ2 = Shapes.twoCircle.rawValue
    var circ3 = Shapes.threeCircles.rawValue
    
    var cardValue = [NSAttributedString: String]()
    var primaryCards = [NSAttributedString]()
        
    
    init() {
        primaryCards = [NSAttributedString]()
        setTextStyle(style: ".b", color: UIColor.blue)
        setTextStyle(style: ".fill.b", color: UIColor.blue)
        setTextStyle(style: ".stroke.b", color: UIColor.blue)
        
        setTextStyle(style: ".r", color: UIColor.red)
        setTextStyle(style: ".fill.r", color: UIColor.red)
        setTextStyle(style: ".stroke.r", color: UIColor.red)
        
        setTextStyle(style: ".g", color: UIColor.green)
        setTextStyle(style: ".fill.g", color: UIColor.green)
        setTextStyle(style: ".stroke.g", color: UIColor.green)
    }
    
    mutating func setTextStyle(style: String, color: UIColor) {
        let rawCards  = [tri1, tri2, tri3, squr1, squr2, squr3, circ1, circ2, circ3]
        for card in rawCards {
            let value = String(card[card.startIndex]) + style
            var myAttribute: [NSAttributedStringKey : Any] = [ .foregroundColor: color]
            if style.contains("fill") {
                myAttribute[NSAttributedStringKey.strokeWidth] = -25.0
            } else if style.contains("stroke") {
                 myAttribute[NSAttributedStringKey.strokeWidth] = -9.0
            }
            
            let myAttrString = NSAttributedString(string: card, attributes: myAttribute)
            primaryCards.append(myAttrString)
            cardValue.updateValue(value, forKey: myAttrString)
        }
        
    }
        
}
