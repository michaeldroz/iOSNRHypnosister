//
//  MiniMapView.swift
//  Hypnosister
//
//  Created by Michael Droz on 11/17/14.
//  Copyright (c) 2014 Michael Droz. All rights reserved.
//

import UIKit

class MiniMapView: UIView {
    
    var relativeX: CGFloat = 0.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    var relativeY: CGFloat = 0.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    var relativeWidth: CGFloat = 0.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    var relativeHeight: CGFloat = 0.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.7)
    }
    
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }

    override func drawRect(rect: CGRect) {
        //Drawing code
        
        let bounds = self.bounds
        
        //Compute the actual values for the rectangle
        let x = bounds.width * relativeX
        let y = bounds.height * relativeY
        let width = bounds.width * relativeWidth
        let height = bounds.height * relativeHeight
        
        //Create the rectangle
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: x, y: y))
        path.addLineToPoint(CGPoint(x: x+width, y: y))
        path.addLineToPoint(CGPoint(x: x+width, y: y+height))
        path.addLineToPoint(CGPoint(x: x, y: y+height))
        path.closePath()
    }
    
    func updateWithScrollView(sv: UIScrollView) {
        relativeX = sv.contentOffset.x / sv.contentSize.width
        relativeY = sv.contentOffset.y / sv.contentSize.height
        relativeWidth = sv.bounds.width / sv.contentSize.width
        relativeHeight = sv.bounds.height / sv.contentSize.height
    }
    
    
    
}
