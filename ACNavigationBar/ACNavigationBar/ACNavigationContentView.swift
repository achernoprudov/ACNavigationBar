//
//  ACNavigationContentView.swift
//  ACNavigationBar
//
//  Created by Andrey Chernoprudov on 01/12/16.
//  Copyright © 2016 Little Stars. All rights reserved.
//

import UIKit

class ACNavigationBarContentView: UIView {
    
    weak var delegate: ACNavigationBarDelegate?

    override func draw(_ rect: CGRect) {
        delegate?.drawContent(inRect: rect)
    }
}
