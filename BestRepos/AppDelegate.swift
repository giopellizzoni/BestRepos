//
//  AppDelegate.swift
//  BestRepos
//
//  Created by Giovanni Pellizzoni on 05/09/18.
//  Copyright © 2018 Giovanni Pellizzoni. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private var appCoordinator: AppCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        self.appCoordinator = AppCoordinator(window: window!)
        self.appCoordinator.start()
        
        return true
    }
    
}

