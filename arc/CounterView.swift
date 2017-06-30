//
//  CounterView.swift
//  arc
//
//  Created by Jaime_Andrade on 6/30/17.
//  Copyright © 2017 Jaime Andrade. All rights reserved.
//

import UIKit

let NoOfGlasses = 8
let pi: CGFloat = CGFloat(M_PI)
//π = alt + p

@IBDesignable class CounterView: UIView {
    
    @IBInspectable var counter: Int = 5 {//5
    //update data on uiview
        
        /*
         This code makes it so that the view refreshes only when the counter is less than or equal to the user's targeted glasses, as the outline only goes up to 8.
         */
        didSet{
            if counter <= NoOfGlasses{
                setNeedsDisplay()
            }
        }
    }
    //You also create three @IBInspectable properties that you can update in the storyboard.
    @IBInspectable var outlineColor: UIColor = UIColor.blue
    @IBInspectable var counterColor: UIColor = UIColor.orange
    
    override func draw(_ rect: CGRect) {
        
        
        /*
         
         1.Define the center point of the view where you’ll rotate the arc around.
         2.Calculate the radius based on the max dimension of the view.
         3.Define the thickness of the arc.
         4.Define the start and end angles for the arc.
         5.Create a path based on the center point, radius, and angles you just defined.
         6.Set the line width and color before finally stroking the path.
         */
        
        //1
        let center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        //center is the point of the compass
        
        //2
        let radius: CGFloat = max(bounds.width, bounds.height)
        
        //3
        let arcWidth: CGFloat = 50//76
        
        //4
        //let startAngle: CGFloat = 3 * pi / 4
        let startAngle: CGFloat = pi / 2
        let endAngle: CGFloat = pi / 4
        
        //5
        var path = UIBezierPath(arcCenter: center, radius: radius/2 - arcWidth, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        //6
        path.lineWidth = arcWidth
        counterColor.setStroke()
        path.stroke()
        
        //---------------------------------------------------------
        
        
        
        /*
         
         1.outlineEndAngle is the angle where the arc should end, calculated using the current counter value.
         2.outlinePath is the outer arc. The radius is given to UIBezierPath() to calculate the actual length of the arc, as this arc is not a unit circle.
         3.Adds an inner arc to the first arc. This has the same angles but draws in reverse (clockwise is set to false). Also, this draws a line between the inner and outer arc automatically.
         */
        
        
        
        //1 first calculate the different between the two angles
        //verificar que es positivo .. ensuring it is positive
        
        let angleDifference: CGFloat = 2 * pi - startAngle + endAngle
        
        //then calculate the arc for each single glass
        let arcLengthPerGlass = angleDifference / CGFloat(NoOfGlasses)
        
        //the multiply out by the actual glasses drunk
        let outlinesEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
        
        //2 draw the outer arc
        var outlinePath = UIBezierPath(arcCenter: center, radius: bounds.width / 2 - 2.5, startAngle: startAngle, endAngle: outlinesEndAngle, clockwise: true)
        
        //3 draw the inner arc
        outlinePath.addArc(withCenter: center, radius: bounds.width / 2 - arcWidth + 2.5, startAngle: outlinesEndAngle, endAngle: startAngle, clockwise: false)
        
        //4 clase the path
        outlinePath.close()
        
        outlineColor.setStroke()
        outlinePath.lineWidth = 5.0
        outlinePath.stroke()
        
        
        
    }
    

}
