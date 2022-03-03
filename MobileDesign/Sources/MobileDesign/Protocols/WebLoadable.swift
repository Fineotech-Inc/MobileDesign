//
//  WebLoadable.swift
//  PlatformUI
//
//  Created by Dexter Kim on 2018-04-12.
//  Copyright © 2018 Rogers Communication Inc. All rights reserved.
//

import Foundation

/// Provides interfaces to load a web page. 
public protocol WebLoadable {
    
    /// A string type of enum conforming RawRepresentable. Each case represents an event / action from the web page.
    ///
    /// - Example:
    ///
    /// ````
    /// enum WebEventName: String {
    ///    case closeSecondaryWebView
    ///    case unknown
    /// }
    /// ````
    associatedtype WebEventName: RawRepresentable

    /// A url to load a web view
    var url: URL? { get set }
    
    /// A boolean variable to hide or show a back button navigating from web to native
    var hideBackButton: Bool { get }
    
    /// Returns an event name corresponding to a given URL
    ///
    /// - Parameter actionUrl: A URL type (i.e. myacc://closeyouraccount)
    /// - Returns: An event name of WebEventName type
    func eventName(fromNavigationActionUrl actionUrl: URL?) -> WebEventName
}
