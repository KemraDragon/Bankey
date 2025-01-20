//
//  AppDelegate.swift
//  Bankey
//
//  Created by Kevin on 20-01-25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

            window = UIWindow(frame: UIScreen.main.bounds)
            window?.backgroundColor = .systemBackground
            window?.rootViewController = LoginViewController()
            window?.makeKeyAndVisible()

            return true
        }

}
