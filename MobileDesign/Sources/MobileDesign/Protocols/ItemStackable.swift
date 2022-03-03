import UIKit

public protocol ItemStackable {
    
    /// A receiver should define a type for the stackable items. It's usually an enum type.
    ///
    /// - Example of implementation on a business logic layer:
    ///
    /// ````swift
    /// // BusinessLogicLayer.swift
    /// struct Model: ItemStackable {
    ///
    ///     enum StackableItem {
    ///         case info
    ///         case badge
    ///         case todayBalance
    ///         case paymentMethod
    ///     }
    ///     var stackableItems: [StackableItem] {
    ///         var items: [StackableItem] = []
    ///         items.append(.info)
    ///         items.append(.badge)
    ///         items.append(.todayBalance)
    ///         items.append(.paymentMethod)
    ///         return items
    ///     }
    /// }
    /// ````
    ///
    /// - Example of implementation on a presentation layer:
    ///
    /// ````swift
    /// func configureStackView() {
    ///     model.stackableItem.forEach {
    ///         switch $0 {
    ///         case .badge:
    ///             badgeView.configure()
    ///             stackView.addSubView(badgeView)
    ///         case .info:
    ///             ...
    ///         }
    ///     }
    /// }
    /// ````
    associatedtype StackableItem
    
    /// An array of items being stacked in UIStackView
    var stackableItems: [StackableItem]! { get }
}
