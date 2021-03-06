//
//  AppDelegate.swift
//  Hypnosister
//
//  Created by Michael Droz on 11/17/14.
//  Copyright (c) 2014 Michael Droz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UIScrollViewDelegate {

    var window: UIWindow?
    var miniMap: MiniMapView?
    var hypnosisView: HypnosisView?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        //Adding a local notificaiton 
        let settings = UIUserNotificationSettings(forTypes: .Alert, categories: nil)
        application.registerUserNotificationSettings(settings)
        
        
        let hvc = HypnosisViewController()
       // window!.rootViewController = hvc
        
        //This variable represent the app bundle
        let appBundle = NSBundle.mainBundle()
        
        //Look in the appBundle for the file ReminderViewController.xib
        let rvc = ReminderViewController(nibName: "ReminderViewController", bundle: appBundle)
        
        let tbc = UITabBarController()
        tbc.viewControllers = [hvc, rvc]
        
        //window!.rootViewController = rvc
        window!.rootViewController = tbc
        
        //Removing as part of the chapter 4: View Controllers
        /*  //Create CGRects for frames
        var screenRect = window!.bounds
        var bigRect = screenRect
        bigRect.size.width *= 2.0
        bigRect.size.height *= 2.0
        
        //Create a screen-sized scroll view and add it to the window
        let scrollView = UIScrollView(frame: screenRect)
        //There will be an error from this line of code; ignore it for now
        
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 2.0
        
        scrollView.delegate = self
         //scrollView.backgroundColor = UIColor.yellowColor()
         window!.addSubview(scrollView)
        
        //Create a super-sized hypnosis view and add it to the scroll view
        let hypnosisView = HypnosisView(frame: bigRect)
        
        //set the property to reference the local variable
        self.hypnosisView = hypnosisView
        
        scrollView.addSubview(hypnosisView)
        
        //Tell the scroll view how big its content area is
        scrollView.contentSize = bigRect.size
        
        
        let miniMap = MiniMapView(frame: CGRect(x: 10, y: 30, width: 75, height: 135))
        window!.addSubview(miniMap)
        miniMap.updateWithScrollView(scrollView)
        self.miniMap = miniMap */
        window!.backgroundColor = UIColor.whiteColor()
        window!.makeKeyAndVisible()
        
        return true
        
    }
    
        
        func scrollViewDidScroll(scrollView: UIScrollView) {
            miniMap?.updateWithScrollView(scrollView)
        }
    
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return hypnosisView
    }
    

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

