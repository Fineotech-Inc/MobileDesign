//
//  UIToolbar+Extensions.swift
//  PlatformUI
//
//  Created by Arbab Khan on 2017-11-14.
//  Copyright © 2017 Rogers Communication Inc. All rights reserved.
//

import Foundation

extension UIToolbar {

    public static func create(target: AnyObject, selector: Selector, title: String) -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.setItems([UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
                          UIBarButtonItem(title: title, style: .plain, target: target, action: selector)],
                         animated: false)
        return toolbar
    }
}
