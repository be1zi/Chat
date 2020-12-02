//
//  UIView.swift
//  Chat
//
//  Created by Konrad Belzowski on 02/12/2020.
//

import UIKit

public extension UIView {

    @IBInspectable
    var rounded: CGFloat {
        set {
            self.layer.cornerRadius = newValue
            self.clipsToBounds = true
        }
        get {
            return self.layer.cornerRadius
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        set {
            self.layer.shadowColor = newValue?.cgColor
        }
        get {
            if let color = self.layer.shadowColor {
                return UIColor(cgColor: color)
            } else {
                return nil
            }
        }
    }
    
    @IBInspectable
    var shadowRedius: CGFloat {
        set {
            self.layer.shadowRadius = newValue
            self.layer.shadowOpacity = 1
            self.layer.shadowOffset = .zero
        }
        get {
            return self.layer.shadowRadius
        }
    }
}
