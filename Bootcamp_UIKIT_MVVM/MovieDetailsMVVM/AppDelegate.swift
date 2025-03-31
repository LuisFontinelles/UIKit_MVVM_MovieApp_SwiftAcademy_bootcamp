//
//  AppDelegate.swift
//  MovieDetailsMVVM
//
//  Created by Luis Fontinelles on 04/03/25.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let mainNavigationController = UINavigationController(rootViewController: MainViewController())
        window.rootViewController = mainNavigationController
        window.makeKeyAndVisible()
        
        self.window = window
        
        return true
    }
}

