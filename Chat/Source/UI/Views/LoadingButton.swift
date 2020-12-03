//
//  Button.swift
//  Chat
//
//  Created by Konrad Belzowski on 03/12/2020.
//

import Foundation
import UIKit

public class LoadingButton: UIButton {
    
    //
    // MARK: - Properties
    //
    
    private var activityIndicator: UIActivityIndicatorView?
    private var title: String?
    
    //
    // MARK: - Actions
    //
    
    public func showLoading() {
        title = titleLabel?.text
        setTitle("", for: .normal)
        
        if activityIndicator == nil {
            activityIndicator = createActivityIndicator()
        }
        
        showActivityIndicator()
    }
    
    public func hideLoading() {
        setTitle(title, for: .normal)
        activityIndicator?.stopAnimating()
    }
    
    //
    // MARK: - Methods
    //
    
    private func createActivityIndicator() -> UIActivityIndicatorView {
        let ac = UIActivityIndicatorView()
        ac.hidesWhenStopped = true
        ac.color = titleLabel?.textColor
        
        return ac
    }
    
    private func showActivityIndicator() {
        activityIndicator?.translatesAutoresizingMaskIntoConstraints = false
        
        if let ac = activityIndicator {
            addSubview(ac)
        }
        
        prepareActivityIndicatorsConstraints()
        activityIndicator?.startAnimating()
    }
    
    private func prepareActivityIndicatorsConstraints() {
        let xCenter = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: activityIndicator, attribute: .centerX, multiplier: 1.0, constant: 0)
        let yCenter = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: activityIndicator, attribute: .centerY, multiplier: 1.0, constant: 0)
        
        self.addConstraints([xCenter, yCenter])
    }
}
