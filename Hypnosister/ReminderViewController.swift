//
//  ReminderViewController.swift
//  Hypnosister
//
//  Created by Michael Droz on 11/18/14.
//  Copyright (c) 2014 Michael Droz. All rights reserved.
//

import UIKit

class ReminderViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func addReminder(sender: AnyObject) {
        let date = datePicker.date
        println("Setting a reminder for \(date)")
        
        let note = UILocalNotification()
        note.alertBody = "Hypnotize me!"
        note.fireDate = date
        UIApplication.sharedApplication().scheduleLocalNotification(note)
    }
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        //Set the tab bar item's title
        tabBarItem.title = "Reminder"
        
        //Put an image on the tab bar item
        tabBarItem.image = UIImage(named: "2c_time.png")
    }
    
    convenience override init() {
        self.init(nibName: "ReminderViewController", bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
   
}
