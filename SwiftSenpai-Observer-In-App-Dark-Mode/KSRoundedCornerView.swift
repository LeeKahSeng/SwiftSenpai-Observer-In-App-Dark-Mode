//
//  KSRoundedCornerView.swift
//  QQCOREG
//
//  Created by Lee Kah Seng on 23/12/2017.
//  Copyright © 2017 Lee Kah Seng. All rights reserved.
//

import UIKit

class KSRoundedCornerView: UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat = 5.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable
    var borderColor: UIColor = .lightGray {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat = 0.5 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // Observe user interface style change
        startObserving(&UserInterfaceStyleManager.shared)
        
        // Set corner radius
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
        
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        
        print("draw")
    }
    
}
