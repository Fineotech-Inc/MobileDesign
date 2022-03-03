//
//  AccessibilityIdentifiable.swift
//  PlatformUI
//
//  Created by smitesh patel on 2019-04-04.
//  Copyright © 2019 Rogers Communication Inc. All rights reserved.
//

import UIKit

/// The location where an element is being accessed
///
/// - homeTabBar: TabBar at the bottom of home page
/// - menu: Drawal menu page
/// - login: Login page
/// - ctnAuth: CTN Authentication page
/// - usage: Usage tab page
/// - billing: Billing tab page
/// - inbox: Inbox tab page
/// - support: Support tab page
/// - more: More tab page
/// - onboarding: Onboarding flow
/// - payment: Payment flow
/// - settings: Support And More Settings flow
/// - unknown: Unknown location
/// - fdm: FDM flows
/// - solarisEquipment: Solaris Equipmemt Flow
/// - solarisUsage: Solaris Usage Flow
/// - solarisPlan: Solaris Plan Flow

public enum AccessibilityLocation: String {
    case homeTabBar
    case menu
    case login
    case ctnAuth
    case usage
    case internetUsage
    case dataSummary
    case billing
    case inbox
    case support
    case more
    case onboarding
    case payment
    case settings
    case unknown
    case fdm
    case profile
    case edit
    case dataCollection
    case termsAndConditions
    case dataTopUp
    case manageAddedData
    case addDataTopUp
    case cancelDataTopUp
    case contactUs
    case faq
    case overage
    case resetVoicemailPassword
    case solarisEquipment
    case internetEquipment
    case solarisUsage
    case solarisPlan
    case internetPlan
    case accountRecovery
    case smartStreamEquipment
    case smartStreamPlan
    case accountRegistration
    case exitSurvey
}

// MARK: - AccessibilityIdentifiable
public protocol AccessibilityIdentifiable {

    /// Instance of the location where an element is being accessed
    var accessibilityLocation: AccessibilityLocation { get set }
    
    /// Implement this function and update the accessibility identifiers for controls or views, which is required to trace.
    func updateAccessibilityIdentifiers()
}

extension AccessibilityIdentifiable {
    
    /// Update the `accessibilityIdentifier` of an element(UIView or UIBarItem), which conforms Accessibility
    /// Identifier Form: [LOCATION]_[TYPE]_[IDENTIFIER]
    ///
    /// - Parameters:
    ///   - element: An instance of UIView or UIBarItem, which is required to update the `accessibilityIdentifier`
    ///   - identifier: An identifier to be accessed by the automation script
    public func updateAccessibilityIdentifier<T>(forElement element: T, identifier: String? = nil, subIdentifier: String? = nil) where T: Accessibility {
        element.updateAccessibilityIdentifier(inLocation: accessibilityLocation, identifier: identifier, subIdentifier: subIdentifier)
    }
}

extension AccessibilityIdentifiable where Self: UITableViewDataSource {
    
    /// Default implementation for UITableViewDataSource
    /// It's empty because a cell/headerView/footerView would use `updateAccessibilityIdentifier:forElement:identifier` instead
    public func updateAccessibilityIdentifiers() { }
}

extension AccessibilityIdentifiable where Self: UICollectionViewDataSource {
    
    /// Default implementation for UICollectionViewDataSource
    /// It's empty because a cell/headerView/footerView would use `updateAccessibilityIdentifier:forElement:identifier` instead
    public func updateAccessibilityIdentifiers() { }
}

// MARK: - Accessibility
public protocol Accessibility {
    
    /// Returns a type of element i.e UIButton -> btn
    var accessibilityElementName: String? { get }
    
    /// Update the `accessibilityIdentifier` of an element
    ///
    /// - Parameters:
    ///   - location: The location the accessibility identifier is being used. AccessibilityLocation
    ///   - identifier: Identifier of the element
    func updateAccessibilityIdentifier(inLocation location: AccessibilityLocation, identifier: String?, subIdentifier: String?)
}

extension Accessibility {
    
    fileprivate func defaultAccessibilityIdentifier(withAccessibilityLocation group: AccessibilityLocation, identifier: String?, subIdentifier: String?) -> String? {
        guard let elementName = accessibilityElementName else { return nil }
        
        var accessibilityId: String = "\(group.rawValue)_\(elementName)"
        
        if let subIdentifier = subIdentifier, !(subIdentifier.isEmpty) {
            accessibilityId += "_\(subIdentifier)"
        }
        
        if let id = identifier, id.isEmpty == false {
            accessibilityId += "_\(id)"
        }
        
        return accessibilityId.contains(" ") ? accessibilityId.replacingOccurrences(of: " ", with: "_") : accessibilityId
    }
}

// MARK: - UIView Extension
extension UIView: Accessibility {
    
    private enum UIAccessibilityElement: String {
        case btn
        case tf
        case sw
        case tableCell
        case collectionCell
        case view
        case imageView
    }
    
    public var accessibilityElementName: String? {
        switch self {
        case is UIButton:
            return UIAccessibilityElement.btn.rawValue
        case is UITextField:
            return UIAccessibilityElement.tf.rawValue
        case is UISwitch:
            return UIAccessibilityElement.sw.rawValue
        case is UITableViewCell:
            return UIAccessibilityElement.tableCell.rawValue
        case is UICollectionViewCell:
            return UIAccessibilityElement.collectionCell.rawValue
        case is UIImageView:
            return UIAccessibilityElement.imageView.rawValue
        default:
            return UIAccessibilityElement.view.rawValue
        }
    }
    
    public func updateAccessibilityIdentifier(inLocation location: AccessibilityLocation, identifier: String? = nil, subIdentifier: String? = nil) {
        accessibilityIdentifier = defaultAccessibilityIdentifier(withAccessibilityLocation: location, identifier: identifier, subIdentifier: subIdentifier)
    }
}

// MARK: - UIBarItem Extension
extension UIBarItem: Accessibility {
    
    private enum UIAccessibilityElement: String {
        case barBtnItem
        case tabBarItem
    }
    
    public var accessibilityElementName: String? {
        switch self {
        case is UIBarButtonItem:
            return UIAccessibilityElement.barBtnItem.rawValue
        case is UITabBarItem:
            return UIAccessibilityElement.tabBarItem.rawValue
        default:
            return nil
        }
    }
    
    public func updateAccessibilityIdentifier(inLocation location: AccessibilityLocation, identifier: String? = nil, subIdentifier: String? = nil) {
        accessibilityIdentifier = defaultAccessibilityIdentifier(withAccessibilityLocation: location, identifier: identifier, subIdentifier: subIdentifier)
    }
}
