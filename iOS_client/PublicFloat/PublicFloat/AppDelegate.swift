//
//  AppDelegate.swift
//  PublicFloat
//
//  Created by Albert Wang on 19/08/2015.
//  Copyright (c) 2015 YellowTeam. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
     static var current_user = User(user_id: 0, user_email: "")

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
//        HTTPSessionManager.allArtWorks() >- subscribe(next: { responseDict, httpResponse in
//            NSLog("next")
//         }, error: { error in
//          NSLog(error.domain)
//        }, completed: {
//          NSLog("completed")
//        })
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {

    }

    func applicationDidEnterBackground(application: UIApplication) {
        
    }

    func applicationWillEnterForeground(application: UIApplication) {

    }

    func applicationDidBecomeActive(application: UIApplication) {

    }

    func applicationWillTerminate(application: UIApplication) {

    }


}

