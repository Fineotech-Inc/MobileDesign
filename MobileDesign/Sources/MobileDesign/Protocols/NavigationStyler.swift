//
//  NavigationStyler.swift
//  PlatformUI
//
//  Created by smitesh patel on 2019-02-07.
//  Copyright © 2019 Rogers Communication Inc. All rights reserved.
//

import Foundation

// MARK: - An enum corresponding to the Navigation bar Style
public enum NavigationStyle: BrandProvider {
    /// style can be original, light, medium and dark
    case original
    case light
    case medium
    case dark

    /// Returns the barTintColor for the navigation bar's styling
    private var barTintColor: UIColor {
        guard let theme = PlatformUI.shared.platformTheme else { return .black }
        switch self {
        case .light:
            return theme.lightNavigationStyleTintColor
        case .medium:
            return theme.mediumNavigationStyleTintColor
        case .dark:
            return theme.darkNavigationStyleTintColor
        default:
            return theme.tintColor
        }
    }

    /// Returns the shadowColor for the navigation bar's styling
    private var shadowColor: UIColor? {
        guard let theme = PlatformUI.shared.platformTheme else { return nil }
        switch self {
        case .original:
            return theme.shadowImageColor
        case .medium:
            return isRogers ? theme.shadowImageColor : theme.mediumShadowImageColor
        default:
            return nil
        }
    }

    /// Returns the image for the navigation bar's styling
    fileprivate var navigationBarImage: UIImage? {
        return barTintColor.image
    }

    /// Returns the statusBarStyle for the navigation bar's styling
    public var statusBarStyle: UIStatusBarStyle {
        switch self {
        case .light, .medium:
            return .default
        default:
            return .lightContent
        }
    }

    /// Returns the barStyle for the navigation bar's styling
    fileprivate var barStyle: UIBarStyle {
        switch self {
        case .light, .medium:
            return .default
        default:
            return .black
        }
    }

    /// Returns the text attributes for the title label
    fileprivate var titleTextAttributes: ThemeAttributes? {
        guard let theme = PlatformUI.shared.platformTheme else { return nil }
        switch self {
        case .light, .medium:
            return theme.lightNavigationBarTextAttributes
        case .dark:
            return theme.darkNavigationBarTextAttributes
        default:
            return theme.navigationBarTextAttributes
        }
    }
    
    /// Returns the tintColor for the navigation bar's styling
    public var tintColor: UIColor {
        guard let theme = PlatformUI.shared.platformTheme else { return .black }
        switch self {
        case .light, .medium:
            return theme.linkTextThemeAttributes.color
        default:
            return theme.navigationBarTextAttributes.color
        }
    }

    /// Returns shadow image
    fileprivate var shadowImage: UIImage {
        return shadowColor?.image ?? UIImage()
    }
    
    /// Returns the text attributes for the back button
    public var backButtonTextAttributes: ThemeAttributes? {
        guard let theme = PlatformUI.shared.platformTheme else { return nil }
        switch self {
        case .light, .medium:
            return theme.lightNavigationBarButtonTextAttributes
        case .dark:
            return theme.darkNavigationBarButtonTextAttributes
        default:
            return theme.barButtonItemTextAttributes
        }
    }
}

/// Provides navigation styles to NavigationBar
public protocol NavigationStyler { }

extension UIViewController: NavigationStyler { }

public extension NavigationStyler where Self: UIViewController {

    func addCancelBarButtonItem(selector: Selector, accessibilityHint: String? = nil) {
        var items = navigationItem.rightBarButtonItems ?? []
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: selector)
        if let accessibilityHint = accessibilityHint {
            cancelButton.accessibilityHint = accessibilityHint
        }
        items.append(cancelButton)
        navigationItem.rightBarButtonItems = items
    }

    func addEditBarButtonItem(selector: Selector) {
        var items = navigationItem.rightBarButtonItems ?? []
        items.append(UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: selector))
        navigationItem.rightBarButtonItems = items
    }

    func addDoneBarButtonItem(selector: Selector) {
        var items = navigationItem.leftBarButtonItems ?? []
        items.append(UIBarButtonItem(barButtonSystemItem: .done, target: self, action: selector))
        navigationItem.rightBarButtonItems = items
    }

    func addShareBarButtonItem(selector: Selector) {
        var items = navigationItem.rightBarButtonItems ?? []
        items.append(UIBarButtonItem(barButtonSystemItem: .action, target: self, action: selector))
        navigationItem.rightBarButtonItems = items
    }

    func addRightBarButtonItem(title: String, selector: Selector, titleAttributes: ThemeAttributes? = nil) {
        var items = navigationItem.rightBarButtonItems ?? []
        let item = UIBarButtonItem(title: title, style: .plain, target: self, action: selector)
        if let titleAttributes = titleAttributes {
            item.setTitleTextAttributes([.foregroundColor: titleAttributes.color,
                                         .font: titleAttributes.font], for: .normal)
            item.setTitleTextAttributes([.foregroundColor:  titleAttributes.color,
                                         .font: titleAttributes.font], for: .highlighted)
        }
        items.append(item)
        navigationItem.rightBarButtonItems = items
    }

    func addCustomBarButtonItem(image: UIImage?, selector: Selector) {
        var items = navigationItem.leftBarButtonItems ?? []
        items.append(UIBarButtonItem(image: image, style: .plain, target: self, action: selector))
        navigationItem.leftBarButtonItems = items
    }

    func addCustomBarButtonItem(image: UIImage?, title: String, font: UIFont, color: UIColor? = nil, imageEdgeInsets: UIEdgeInsets = .zero, selector: Selector) {
        let barButton: UIButton = {
            let btn = UIButton(type: .system)
            btn.setImage(image, for: .normal)
            btn.setTitle(title, for: .normal)
            btn.titleLabel?.font = font
            btn.setTitleColor(color, for: .normal)
            btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
            btn.addTarget(self, action: selector, for: .touchUpInside)
            return btn
        }()

        var items = navigationItem.leftBarButtonItems ?? []
        items.append(UIBarButtonItem(customView: barButton))
        navigationItem.leftBarButtonItems = items
    }

    func applyStyle(_ navigationStyle: NavigationStyle = .original) {
        navigationController?.navigationBar.setBackgroundImage(navigationStyle.navigationBarImage, for: .default)
        navigationController?.navigationBar.barStyle = navigationStyle.barStyle
        navigationController?.navigationBar.shadowImage = navigationStyle.shadowImage

        guard let titleTextAttributes = navigationStyle.titleTextAttributes else { return }
        navigationController?.navigationBar.tintColor = navigationStyle.tintColor
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: titleTextAttributes.color, .font: titleTextAttributes.font]
    }
}
