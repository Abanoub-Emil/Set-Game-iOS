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
    
    
    
    var primaryImagesNames = ["CylinderG1","DiamondG2",  "CylinderG3",
                          "CylinderR1", "DiamondR2", "CylinderR3",
                          "CylinderP1", "CylinderP2", "CylinderP3",
                          "SG1", "SG2", "SG3"]
                          
    
var secondryImagesNames = ["SR1", "SR2", "SR3",
                          "SP1", "SP2", "SP3",
                          "DiamondG1", "CylinderG2", "DiamondG3",
                          "DiamondR1", "CylinderR2", "DiamondR3"]
    
    
    var primaryCards: [NSAttributedString]?
    
    
    
    
    init() {
        primaryCards = [NSAttributedString]()
        setTextStyle(style: "", color: UIColor.blue)
        setTextStyle(style: "fill", color: UIColor.blue)
        setTextStyle(style: "stroke", color: UIColor.blue)
        
        setTextStyle(style: "", color: UIColor.red)
        setTextStyle(style: "fill", color: UIColor.red)
        setTextStyle(style: "stroke", color: UIColor.red)
        
        setTextStyle(style: "", color: UIColor.green)
        setTextStyle(style: "fill", color: UIColor.green)
        setTextStyle(style: "stroke", color: UIColor.green)
    }
    
    mutating func setTextStyle(style: String, color: UIColor) {
        let rawCards  = [tri1, tri2, tri3, squr1, squr2, squr3, circ1, circ2, circ3]
        for card in rawCards {
            var myAttribute: [NSAttributedStringKey : Any] = [ .foregroundColor: color]
            if style == "fill" {
                myAttribute[NSAttributedStringKey.strokeWidth] = -18.0
            } else if style == "stroke" {
                 myAttribute[NSAttributedStringKey.strokeWidth] = -5.0
            }
            
            let myAttrString = NSAttributedString(string: card, attributes: myAttribute)
            primaryCards?.append(myAttrString)
            
        }
    }
        
}
