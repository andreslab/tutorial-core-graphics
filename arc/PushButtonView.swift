//
//  PushButtonView.swift
//  arc
//
//  Created by Jaime_Andrade on 6/30/17.
//  Copyright © 2017 Jaime Andrade. All rights reserved.
//

import UIKit


@IBDesignable
class PushButtonView: UIButton {
    
    
    /*
     @IBInspectable is an attribute you can add to a property that makes it readable by Interface Builder. This means that you will be able to configure the color for the button in your storyboard instead of in code.
     */
    
    @IBInspectable var fillColor: UIColor = UIColor.green
    @IBInspectable var isAddButton: Bool = true

    
    override func draw(_ rect: CGRect) {
   
        var path = UIBezierPath(ovalIn: rect)
        fillColor.setFill() //indica que el color editable
        path.fill()
        
        
        
        //draw plus sign
        
        //set up the witdh and height variables
        //for the horizontal stroke
        let plushHeight: CGFloat = 3.0
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.6
        
        //create the path
        var plusPath = UIBezierPath()
        
        //set the path line with to the height of the stroke
        plusPath.lineWidth = plushHeight
        
        //move the initial point of the path
        //to the start of the horizontal stroke
        plusPath.move(to: CGPoint(x:
            bounds.width/2 - plusWidth / 2 + 0.5,
                           y: bounds.height / 2 + 0.5))
        
        //add a point to the path at the end of the stroke
        plusPath.addLine(to: CGPoint(x: bounds.width / 2 + plusWidth / 2 + 0.5, y: bounds.height / 2 + 0.5))
        
        
        if isAddButton{
        //vertical line
        //vertical line
        plusPath.move(to: CGPoint(x: bounds.width / 2 + 0.5, y: bounds.height / 2 - plusWidth / 2 + 0.5))
        
        plusPath.addLine(to: CGPoint(x: bounds.width / 2 + 0.5, y: bounds.height / 2 + plusWidth / 2 + 0.5))
        }
        
        //set the stroke color
        UIColor.white.setStroke()
        
        //draw the stroke
        plusPath.stroke()
        
    }
    
}
