//
//  ACNavigationTitleView.swift
//  ACNavigationBar
//
//  Created by Andrey Chernoprudov on 01/12/16.
//  Copyright © 2016 Little Stars. All rights reserved.
//

import UIKit

open class ACNavigationTitleView: UIView {
    
    var title: String? {
        didSet { titleDidSet() }
    }
    
    var subtitle: String? {
        didSet { subtitleDidSet(subtitle: subtitle, oldSubtitle: oldValue) }
    }
    
    open dynamic var titleFontColor: UIColor = .black
    open dynamic var subtitleFontColor: UIColor = .gray
    open dynamic var titleFont: UIFont = .boldSystemFont(ofSize: 17)
    open dynamic var titleFontInSubtitleMode: UIFont = .boldSystemFont(ofSize: 17)
    open dynamic var subtitleFont: UIFont = .systemFont(ofSize: 13)
    
    fileprivate var contentView: ACNavigationBarContentView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContentView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContentView()
    }
    
    func configureContentView() {
        contentView = ACNavigationBarContentView(frame: frame)
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.delegate = self
        addSubview(contentView)
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        clipsToBounds = true
    }
    
    private func titleDidSet() {
        contentView.setNeedsDisplay()
    }
    
    private func subtitleDidSet(subtitle: String?, oldSubtitle: String?) {
        if String.isNotEmpty(string: subtitle) && String.isEmpty(string: oldSubtitle) {
            // Appearing animation
            let transition = makeAppearingTransition()
            transition.subtype = kCATransitionFromTop
            contentView.layer.add(transition, forKey: nil)
        } else if String.isEmpty(string: subtitle) && String.isNotEmpty(string: oldSubtitle) {
            // Disapearing animation
            let transition = makeAppearingTransition()
            transition.subtype = kCATransitionFromBottom
            contentView.layer.add(transition, forKey: nil)
        }
        contentView.setNeedsDisplay()
    }
    
    private func makeAppearingTransition() -> CATransition {
        let transition = CATransition()
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionPush
        transition.setValue(kCFBooleanFalse, forKey: kCATransitionFade)
        return transition
    }
}

extension ACNavigationTitleView: ACNavigationBarDelegate {
    
    
    /// Calculate title offset in CGFloat
    ///
    /// - Parameters:
    ///   - rect: rect that used to calculate offset
    ///   - withSubtitle: is subtitlte shown
    /// - Returns: absolute offset for title. Guaranted grather than zero
    func calcTitleOffset(inRect rect: CGRect, withSubtitle: Bool) -> CGFloat {
        let superViewFrameWidth = superview?.frame.size.width ?? 0
        var finalCenter = (superViewFrameWidth / 2) - (frame.origin.x + rect.size.width / 2)
        
        let label = UILabel()
        label.text = title
        label.font = String.isEmpty(string: subtitle) ? titleFontInSubtitleMode : titleFont
        label.sizeToFit()
        
        let spaceLeft = (rect.size.width + finalCenter) - label.frame.size.width
        if (spaceLeft < 0) {
            return 0
        }
        if (spaceLeft < fabs(finalCenter)) {
            finalCenter = spaceLeft - fabs(finalCenter)
        }
        return max(0, finalCenter)
    }
    
    func drawContent(inRect rect: CGRect) {
        guard let style = NSParagraphStyle.default.mutableCopy() as? NSMutableParagraphStyle else {
            return
        }
        style.lineBreakMode = .byTruncatingTail
        style.alignment = .center
        
        if let subtitle = subtitle {
            var titleRect = rect
            titleRect.origin.y = 4
            titleRect.origin.x = calcTitleOffset(inRect: rect, withSubtitle: true)
            titleRect.size.height = 20
            titleFontColor.setFill()
            let text = (title ?? "") as NSString
            text.draw(in: titleRect, withAttributes: [
                NSForegroundColorAttributeName : titleFontColor,
                NSFontAttributeName : titleFontInSubtitleMode,
                NSParagraphStyleAttributeName : style
            ])
            
            var subtitleRect = rect
            subtitleRect.origin.y = 24
            subtitleRect.size.height = rect.size.height - 24
            subtitleRect.origin.x = calcTitleOffset(inRect: rect, withSubtitle: true)
            subtitleFontColor.setFill()
            let subtitleText = subtitle as NSString
            subtitleText.draw(in: subtitleRect, withAttributes: [
                NSForegroundColorAttributeName : subtitleFontColor,
                NSFontAttributeName : subtitleFont,
                NSParagraphStyleAttributeName : style
            ])
        } else {
            var titleRect = rect
            titleRect.origin.y = (rect.size.height - 24) / 2
            titleRect.origin.x = calcTitleOffset(inRect: rect, withSubtitle: false)
            titleRect.size.height = 24
            titleFontColor.setFill()
            let text = (title ?? "") as NSString
            text.draw(in: titleRect, withAttributes: [
                NSForegroundColorAttributeName : titleFontColor,
                NSFontAttributeName : titleFont,
                NSParagraphStyleAttributeName : style
            ])
        }
    }
}
