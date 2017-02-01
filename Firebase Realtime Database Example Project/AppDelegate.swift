//
//  AppDelegate.swift
//  Firebase Realtime Database Example Project
//
//  Created by Zulwiyoza Putra on 2/1/17.
//  Copyright © 2017 zulwiyozaputra. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Configurig Firebase to the app
        FIRApp.configure()
        
        return true
    }

}

