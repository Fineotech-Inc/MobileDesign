//
//  UITextView+Extensions.swift
//  PlatformUI
//
//  Created by Amala Muthukumar on 2020-10-24.
//  Copyright © 2020 Rogers Communication Inc. All rights reserved.
//

import Foundation

public extension UITextView {

    static func create(text: StringsAttributable, isScrollEnabled: Bool = false, isEditable: Bool = false, textAlignment: NSTextAlignment = .left, dataDetectorTypes: UIDataDetectorTypes = .all) -> UITextView {
        let textView = UITextView()
        textView.textAlignment = textAlignment
        textView.configure(text: text)
        textView.isScrollEnabled = isScrollEnabled
        textView.isEditable = isEditable
        textView.dataDetectorTypes = dataDetectorTypes
        return textView
    }
}
