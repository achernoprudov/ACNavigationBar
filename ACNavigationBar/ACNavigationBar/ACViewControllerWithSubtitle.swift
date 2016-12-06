//
//  ACViewControllerWithSubtitle.swift
//  ACNavigationBar
//
//  Created by Andrey Chernoprudov on 01/12/16.
//  Copyright © 2016 Little Stars. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    public func update(title: String?) {
        if let titleView = navigationItem.titleView as? ACNavigationTitleView {
            titleView.title = title
        }
    }
    
    public func update(subtitle: String?) {
        if let titleView = navigationItem.titleView as? ACNavigationTitleView {
            titleView.subtitle = subtitle
        }
    }
}
