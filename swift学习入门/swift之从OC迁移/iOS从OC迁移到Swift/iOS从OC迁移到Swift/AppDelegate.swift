//
//  AppDelegate.swift
//  iOS从OC迁移到Swift
//
//  Created by mac on 2020/12/6.
//

import UIKit


class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window? = UIWindow()
        let mainVc = ViewController()
        self.window?.rootViewController = mainVc
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        return true
    }
}

