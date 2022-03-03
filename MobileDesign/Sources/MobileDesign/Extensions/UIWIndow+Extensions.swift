//
//  UIWIndow+Extensions.swift
//  PlatformUI
//
//  Created by smitesh patel on 2019-04-14.
//  Copyright © 2019 Rogers Communication Inc. All rights reserved.
//

import Foundation

public extension UIWindow {
    
    /// Unload all views and add back.
    /// Useful for applying `UIAppearance` changes to existing views.
    func reload() {
        subviews.forEach { view in
            view.removeFromSuperview()
            addSubview(view)
        }
    }
}

public extension Array where Element == UIWindow {
    
    /// Unload all views for each `UIWindow` and add back.
    /// Useful for applying `UIAppearance` changes to existing views.
    func reload() {
        forEach { $0.reload() }
    }
}
