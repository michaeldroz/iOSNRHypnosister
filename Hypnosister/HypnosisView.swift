//
//  HypnosisView.swift
//  Hypnosister
//
//  Created by Michael Droz on 11/17/14.
//  Copyright (c) 2014 Michael Droz. All rights reserved.
//

import UIKit

class HypnosisView: UIView {
    var radiusOffset: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    var timer: NSTimer?
    
    
    override func didMoveToSuperview() {
        if superview != nil {
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0/30.0,
                target: self,
                selector: "timerFired:",
                userInfo: nil,
                repeats: true)
        }
    }
    
    override func removeFromSuperview() {
        timer?.invalidate()
        timer = nil
        super.removeFromSuperview()
    }

    func timerFired(timer: NSTimer) {
        println("pew")
        
        //Increment the radius offset
        radiusOffset += 1.0
        
        //reset the radius offset at 20 to create a nice, lopping effect
        if radiusOffset > 20 {
            radiusOffset = 0
        }
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //All HypnosisViews start with a clear background color
        backgroundColor = UIColor.clearColor()
        
    }
    
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        let bounds = self.bounds
        
        //Figure out the cetner of the bounds rectangle
        let centerX = bounds.origin.x + bounds.size.width / 2.0
        let centerY = bounds.origin.y + bounds.size.height / 2.0
        let center = CGPoint(x: centerX, y: centerY)
        
        //The circle will be the largest that will fin in the view
        //let radius = min(bounds.size.width, bounds.size.height) / 2.0
        
        //The largest circle will circumscribe the view
        let maxRadius = CGFloat(hypot(CDouble(bounds.size.width), CDouble(bounds.size.height)) / 2.0)
        
        //Keep drawing bigger circles until the radius is 
        //larger than the maximum visible radius
        for var radius: CGFloat = 0.0; radius < maxRadius; radius += 20 {
        
        let path = UIBezierPath()
        
        //Add an arc to the path at center, with radius of radious
        //from 0 to 2*PI radians (a circle)
        path.addArcWithCenter(center,
            radius: radius + radiusOffset, //add the radius offset to the current radius
            startAngle: 0,
            endAngle: CGFloat(M_PI * 2.0),
            clockwise: true)
        
        //Configure line width to 10 points
        path.lineWidth = 10
        
        //Configure the drawing color to purple
        //UIColor.purpleColor().setStroke()
            let alpha = ((radius + radiusOffset - 10) / maxRadius)
            UIColor.purpleColor().colorWithAlphaComponent(alpha).setStroke()
        //Draw the line
        path.stroke()
    }
    }

}
