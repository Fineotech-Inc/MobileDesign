//
//  UIStoryboardProtocols.swift
//  PlatformUI
//
//  Created by Dexter Kim on 2018-04-12.
//  Copyright © 2018 Rogers Communication Inc. All rights reserved.
//

import Foundation

// MARK: - UIStoryboardInitiatable
/// Provides convenient interfaces to initialize a view controller from a certain storyboard given storyboard identify enums
public protocol UIStoryboardInitiatable {
    
    /// A string type of enum conforming RawRepresentable. Each case represents a name of the storyboard.
    ///
    /// - Example:
    ///
    /// ````swift
    /// // Storyboard+Extensions.swift
    /// extension Storyboard {
    ///
    ///     enum Storyboard: String {
    ///         case main = "Main" // Main.storyboard
    ///     }
    /// }
    /// ````
    associatedtype Storyboard: RawRepresentable
}

extension UIStoryboardInitiatable where Self: UIStoryboard {
    
    /// Instantiates and returns the view controller with the specified identifier named as the class name.
    ///
    /// - Returns: The view controller corresponding to the specified identifier string.
    public func instantiateViewController<T: UIViewController>() -> T {
        guard let viewController = instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Couldn’t instantiate view controller with identifier \(T.storyboardIdentifier)")
        }
        return viewController
    }
}

// MARK: - UIStoryboardIdentifiable
/// Provides a storyboard identifier of an object conforming this protocol.
/// - References: UIStoryboardInitiatable
public protocol UIStoryboardIdentifiable {

    /// A string type of a storyboard identifier
    static var storyboardIdentifier: String { get }
}

extension UIStoryboardIdentifiable where Self: UIViewController {
    
    /// Returns the storyboard identifier named as class name.
    public static var storyboardIdentifier : String {
        return String(describing: self)
    }
}

extension UIViewController: UIStoryboardIdentifiable {}
