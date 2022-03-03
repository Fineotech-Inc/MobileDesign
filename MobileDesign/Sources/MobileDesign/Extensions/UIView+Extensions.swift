//
//  UIView+Extensions.swift
//  PlatformUI
//
//  Created by Dexter Kim on 2018-05-22.
//  Copyright © 2018 Rogers Communication Inc. All rights reserved.
//

import Foundation
import WebKit

/// Typealias for WKNavigationDelegate and UIScrollViewDelegate
public typealias WebViewDelegates = WKNavigationDelegate & UIScrollViewDelegate

public extension UIView {
    
    /// Add a shadow on a view's layer with given parameters
    ///
    /// - Parameters:
    ///   - color: The color of the layer’s shadow. Animatable.
    ///   - opacity: The opacity of the layer’s shadow. Animatable.
    ///   - radius: The blur radius (in points) used to render the layer’s shadow. Animatable.
    ///   - offset: The offset (in points) of the layer’s shadow. Animatable.
    func addShadow(color: UIColor, opacity: Float, radius: CGFloat? = nil, offset: CGSize? = nil) {
        if let offset = offset {
            layer.shadowOffset = offset
        }
        
        if let radius = radius {
            layer.shadowRadius = radius
        }
        
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
    }
    
    /// Add a border on a view's layer
    ///
    /// - Parameters:
    ///   - color: The color of the layer’s border. Animatable.
    ///   - width: The width of the layer’s border. Animatable.
    func addBorder(color: UIColor, width: Float) {
        layer.borderColor = color.cgColor
        layer.borderWidth = CGFloat(width)
    }
    
    /// Add a separator as a sub view with given parameters and return it
    ///
    /// - Parameters:
    ///   - color: The separator’s background color.
    ///   - height: The height of the separator’s frame as CGFloat.
    ///   - returns: the separator view created as a result
    @discardableResult
    func addSeparator(color: UIColor? = nil, height: CGFloat = 1.0) -> UIView {
        guard let color = color else {
            return addConstraintSubview(AppSeparator(), height: height)
        }
        let view = UIView()
        view.backgroundColor = color
        return addConstraintSubview(view, height: height)
    }

    /// Add a bottom border as a sub view with given parameters and return it
    ///
    /// - Parameters:
    ///   - height: The height of the bottom borders frame as CGFloat.
    ///   - returns: the bottom borders view created as a result
    func addBottomBorder(height: CGFloat = 2.0) {
        addConstraintSubview(AppBottomBorder(), height: height)
    }
    
    /// Round corners of a view with given radius value
    ///
    /// - Parameter
    ///   - corners: The corners for rectangle to be set with radius.
    ///   - radius: The radius to use when drawing rounded corners for the layer’s background. Animatable.
    func setRound(withRadius radius: CGFloat, atCorners corners: CACornerMask = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]) {
        layer.cornerRadius = radius
        layer.maskedCorners = corners
    }
    
    /// Adds a view to the end of the receiver’s list of subviews with anchoring by given edgeInset.
    ///
    /// - Parameters:
    ///   - view: The view to be added.
    ///   - edgeInset: The inset distances for views.
    func addConstraintSubview(_ view: UIView, edgeInset: UIEdgeInsets = .zero) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(view)
        
        view.topAnchor.constraint(equalTo: topAnchor, constant: edgeInset.top).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: edgeInset.bottom).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: edgeInset.left).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: edgeInset.right).isActive = true
    }
    
    /// Adds an array of subviews to the view.
    func addSubviews(_ views: [UIView]) {
        views.forEach {
            addSubview($0)
        }
    }
    
    /// Remove all subviews.
    func removeAllSubViews() {
        self.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
}

// MARK: - Public statics
extension UIView {
    
    /// Create a auto layout view with given options
    ///
    /// - Parameters:
    ///   - view: A sub view
    ///   - edgeInsets: An edge insets with the sub view
    ///   - backgroundColor: Background color of the current view
    /// - Returns: A view instance created
    public static func createAutoLayoutView(withSubview view: UIView, edgeInsets: UIEdgeInsets = .zero, backgroundColor: UIColor = .white) -> UIView {
        let newView = UIView()
        newView.translatesAutoresizingMaskIntoConstraints = false
        newView.backgroundColor = backgroundColor
        newView.addConstraintSubview(view, edgeInset: edgeInsets)
        return newView
    }
    // MARK: - Create a auto layout view.
    public static func autolayoutView<T>() -> T where T: UIView {
        let view = T()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}

// MARK: - WKWebView
extension UIView {
    
    /// Load an HTML string into a WebView
    ///
    /// - Parameters:
    ///   - view: A sub view
    ///   - urlString: A URL to load in String format
    ///   - webView: The WebView to load the HTML into - gets inserted into view
    ///   - delegate: The WebViewDelegates(see typealias above) in which to set webview
    ///               navigation and scrollview delegates
    /// - Returns: Nothing - only makes changes to WebView
    public func loadHTMLString(_ urlString: String, withWebView webView: WKWebView = WKWebView(), delegate: WebViewDelegates) {
        webView.navigationDelegate = delegate
        webView.scrollView.delegate = delegate
        addConstraintSubview(webView)
        if let resourcePath = PlatformUI.platformBundle.resourcePath {
            let url = URL(fileURLWithPath: resourcePath)
            webView.loadHTMLString(urlString, baseURL: url)
        }
    }
}

public extension UIView {
    
    /// Border color of view; also inspectable from Storyboard.
    @IBInspectable dynamic var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            guard let color = newValue else {
                layer.borderColor = nil
                return
            }
            
            layer.borderColor = color.cgColor
        }
    }
    
    /// Border width of view; also inspectable from Storyboard.
    @IBInspectable dynamic var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    /// Corner radius of view; also inspectable from Storyboard.
    @IBInspectable dynamic var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    /// Shadow offset of view; also inspectable from Storyboard.
    @IBInspectable dynamic var shadowOffset: CGSize {
        get { return layer.shadowOffset }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    /// Shadow radius of view; also inspectable from Storyboard.
    @IBInspectable dynamic var shadowRadius: CGFloat {
        get { return layer.shadowRadius }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    /// Shadow opacity of view; also inspectable from Storyboard.
    @IBInspectable dynamic var shadowOpacity: Float {
        get { return layer.shadowOpacity }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    /// Shadow color of view; also inspectable from Storyboard.
    @IBInspectable dynamic var shadowColor: UIColor? {
        get {
            guard let color = layer.shadowColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            guard let color = newValue else {
                layer.shadowColor = nil
                return
            }
            
            layer.shadowColor = color.cgColor
        }
    }
    
    /// Add bottom border of view; also inspectable from Storyboard.
    @IBInspectable dynamic var hasBottomBorder: Bool {
        get { return self.hasBottomBorder }
        set {
            if newValue {
                addBottomBorder()
            }
        }
    }
    
    /// Add shadow to view.
    ///
    /// - Parameters:
    ///   - color: shadow color (default is #137992).
    ///   - radius: shadow radius (default is 3).
    ///   - offset: shadow offset (default is .zero).
    ///   - opacity: shadow opacity (default is 0.5).
    func addShadow(
        ofColor color: UIColor = .black,
        radius: CGFloat = 3,
        offset: CGSize = .zero,
        opacity: Float = 0.5)
    {
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
    }
}

extension UIButton {
    
    @objc dynamic var titleLabelFont: UIFont! {
        get { return titleLabel?.font }
        set { titleLabel?.font = newValue }
    }
}

// MARK: - Privates
extension UIView {
    
    @discardableResult
    public func addConstraintSubview(_ view: UIView, height: CGFloat) -> UIView {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(view)
        
        view.heightAnchor.constraint(equalToConstant: height).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        return view
    }
}

public extension UIView {
    
    /// Adds gradient to the view.
    ///
    /// - Parameters:
    ///   - colors: the gradient colors
    ///   - locations: the gradient stops
    ///   - Returns: Nothing - only applies gradient to the view
    func applyGradient(colors:[UIColor], locations:[NSNumber], edgeInset: UIEdgeInsets = .zero) -> Void {
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: bounds.origin.x + edgeInset.left, y: bounds.origin.y + edgeInset.top, width: bounds.size.width - edgeInset.left + edgeInset.right, height: bounds.size.height - edgeInset.top + edgeInset.bottom)
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.locations = locations
        layer.insertSublayer(gradientLayer, at: 0)
    }

    /// Adds blur effect to the view.
    func applyBlurEffect() {
        let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
    }

    /// Adds a toast view anchoring by given edgeInset.
    ///
    /// - Parameters:
    ///   - view: The toast view to be added.
    ///   - position: The toast view position on the view - ie., top or bottom
    ///   - edgeInset: The inset distances for toast view.
    func addConstrainedToastView(_ view: UIView, position: ToastPosition = .bottom, edgeInsets: UIEdgeInsets) {
        view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: edgeInsets.left).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -edgeInsets.right).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -(safeAreaInsets.bottom + edgeInsets.bottom)).isActive = position == .bottom
        view.topAnchor.constraint(equalTo: topAnchor, constant: safeAreaInsets.top + edgeInsets.top).isActive = position == .top
    }
}

// MARK: - Precursor to SwiftUI
public extension UIView {
    
    /// Creates an ImageView.
    ///
    /// - Parameters:
    ///   - width: The width of the image view.
    ///   - height: The height of the image view
    ///   - contentMode: The content mode of the image view.
    func createImageView(width: CGFloat, height: CGFloat, contentMode: UIView.ContentMode) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: height).isActive = true
        imageView.contentMode = contentMode
        return imageView
    }
    
    /// Creates a UILabel.
    func createLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }
    
    /// Creates a UIButton given a theme.
    func createButton(for theme: ThemeAttributes) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.heightAnchor.constraint(greaterThanOrEqualToConstant: 44).isActive = true
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.setTitleColor(theme.color, for: .normal)
        button.titleLabel?.applyTheme(theme)
        button.titleLabel?.textAlignment = .center
        button.sizeToFit()
        return button
    }
    
    /// Creates a horizontal stack view.
    func createHorizontalStackView(spacing: CGFloat = 0) -> UIStackView {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = spacing
        return view
    }
    
    /// Creates a vertical stack view.
    func createVerticalStackView(spacing: CGFloat = 0) -> UIStackView {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = spacing
        return view
    }
}

/*
 This extension allows an element to be added as a subview with an option to activate constraints. There is also a method to activate constraints wrt to different views by calling the activateConstraints method.
 */
public extension UIView {
    
    func addTo(view: UIView, constraints: [LayoutAnchor] = []) {
        translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self)
        if !constraints.isEmpty {
            activate(anchors: constraints, relativeTo: view)
        }
    }
    
    func addTo(stackView: UIStackView, constraints: [LayoutAnchor] = []) {
        translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(self)
        if !constraints.isEmpty {
            activate(anchors: constraints, relativeTo: stackView)
        }
    }
    
    func activateConstraints(relativeTo view: UIView, anchors: [LayoutAnchor]) {
        activate(anchors: anchors, relativeTo: view)
    }
}

private extension UIView {
    
    func activate(anchors: [LayoutAnchor], relativeTo item: UIView) {
        let constraints = anchors.map { NSLayoutConstraint(from: self, to: item, anchor: $0) }
        NSLayoutConstraint.activate(constraints)
    }
}

