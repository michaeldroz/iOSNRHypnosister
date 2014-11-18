//
//  HypnosisViewController.swift
//  Hypnosister
//
//  Created by Michael Droz on 11/18/14.
//  Copyright (c) 2014 Michael Droz. All rights reserved.
//

import UIKit

class HypnosisViewController: UIViewController {
    
    override func loadView() {
        //Create a view
        let frame = UIScreen.mainScreen().bounds
        let backgroundView = HypnosisView(frame: frame)
        
        //set it as *the* view of this view controller
        view = backgroundView
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        //Set the tab bar item's title
        tabBarItem.title = "Hypnotize"
        
        //Put an image on the tab bar item
        tabBarItem.image = UIImage(named: "hypno.png")
    }
   
    convenience override init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder) 
    }
}
