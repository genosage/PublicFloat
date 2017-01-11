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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
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

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {

    }


}

