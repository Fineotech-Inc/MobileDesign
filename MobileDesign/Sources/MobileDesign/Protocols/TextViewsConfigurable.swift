//
//  TextViewsConfigurable.swift
//  PlatformUI
//
//  Created by Khalid Asad on 2019-02-05.
//  Copyright © 2019 Rogers Communication Inc. All rights reserved.
//

import Foundation

// MARK: - StringsAttributable
/// Extends upon String and NSAttributedString so that they are in one umbrella Protocol.
public protocol StringsAttributable {}
extension String: StringsAttributable {}
extension NSAttributedString: StringsAttributable {}

/// Configures text in Text Views of UIView - if text exists, add it, if not hide the view.
public protocol TextViewsConfigurable {
    
    /// Takes a String or NSAttributedString to be applied to certain text views.
    ///
    /// Usage: label.configure(text: "Hello")
    ///
    /// - Parameter A StringsAttributable Type of String or NSAttributedString (i.e. "Hello Rogers")
    /// - Returns: Nothing
    func configure(text: StringsAttributable?)
}

extension UILabel: TextViewsConfigurable {
    
    /// Sets text or attributed text for a UILabel if it exists and hides if it does not.
    public func configure(text: StringsAttributable?) {
        if let text = text as? String {
            self.text = text
        } else if let text = text as? NSAttributedString {
            attributedText = text
        } else {
            isHidden = true
        }
    }
    
    /// Sets theme attributes in UILabel
    public func applyTheme(_ themeAttributes: ThemeAttributes) {
        font = themeAttributes.font
        textColor = themeAttributes.color
    }
}

extension UITextField: TextViewsConfigurable {
    
    /// Sets text or attributed text for a UITextField if it exists and hides if it does not.
    public func configure(text: StringsAttributable?) {
        if let text = text as? String {
            self.text = text
        } else if let text = text as? NSAttributedString {
            attributedText = text
        } else {
            isHidden = true
        }
    }
}

extension UITextView: TextViewsConfigurable {
    
    /// Sets text or attributed text for a UITextView if it exists and hides if it does not.
    public func configure(text: StringsAttributable?) {
        if let text = text as? String {
            self.text = text
        } else if let text = text as? NSAttributedString {
            attributedText = text
        } else {
            isHidden = true
        }
    }
}
