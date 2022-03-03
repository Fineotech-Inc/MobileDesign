//
//  UITextField+Extensions.swift
//  PlatformUI
//
//  Created by Khalid Asad on 9/22/20.
//  Copyright © 2020 Rogers Communication Inc. All rights reserved.
//

import Foundation

extension UITextField {

    func addToolBar(target: AnyObject, selector: Selector, title: String) {
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.sizeToFit()
        toolbar.setItems([UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
                          UIBarButtonItem(title: title, style: .plain, target: target, action: selector)],
                         animated: false)
        toolbar.isUserInteractionEnabled = true

        inputAccessoryView = toolbar
    }
}
