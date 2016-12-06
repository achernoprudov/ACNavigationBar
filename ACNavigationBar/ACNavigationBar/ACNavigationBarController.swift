//
//  ACNavigationBarController.swift
//  ACNavigationBar
//
//  Created by Andrey Chernoprudov on 01/12/16.
//  Copyright © 2016 Little Stars. All rights reserved.
//

import UIKit

public class ACNavigationBarController: UINavigationController {

    override public func viewDidLoad() {
        super.viewDidLoad()
        addTitleView(toViewController: topViewController)
    }
    
    public override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        addTitleView(toViewController: viewController)
        super.pushViewController(viewController, animated: animated)
    }

    func addTitleView(toViewController controller: UIViewController?) {
        let width = view.frame.size.width * 0.95
        let titleView = ACNavigationTitleView(frame: CGRect(x: 0, y: 0, width: width, height: 44))
        controller?.navigationItem.titleView = titleView
        controller?.title = controller?.title ?? controller?.navigationItem.title
    }
}
