//
//  AppDelegate.swift
//  ACNavigationBar Example
//
//  Created by Andrey Chernoprudov on 01/12/16.
//  Copyright © 2016 Little Stars. All rights reserved.
//

import UIKit
import ACNavigationBar

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let appearance = ACNavigationTitleView.appearance()
        appearance.titleFontColor = UIColor.black
        appearance.subtitleFontColor = UIColor.gray
        
        appearance.titleFont = UIFont.boldSystemFont(ofSize: 17)
        appearance.titleFontInSubtitleMode = UIFont.boldSystemFont(ofSize: 17)
        appearance.subtitleFont = UIFont.systemFont(ofSize: 13)
        
        return true
    }
}

