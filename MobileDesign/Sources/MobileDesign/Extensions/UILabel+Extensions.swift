//
//  UILabel+Extensions.swift
//  PlatformUI
//
//  Created by Amala Muthukumar on 2020-11-06.
//  Copyright © 2020 Rogers Communication Inc. All rights reserved.
//

import Foundation

public extension UILabel {

    /// Applies font and color theme attributes to the UILabel.
    func set(themeAttributes: ThemeAttributes?) {
        font = themeAttributes?.font
        textColor = themeAttributes?.color
    }

    /// Activates width to the UILabel.
    func setWidth(value: CGFloat) {
        widthAnchor.constraint(equalToConstant: value).isActive = true
    }
}
