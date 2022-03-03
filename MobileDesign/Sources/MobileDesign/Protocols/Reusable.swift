import UIKit

public protocol Reusable {

    /// A static read-only property returning a string type of a reusable identifier representing an object which conforms this protocol
    static var reuseIdentifier: String { get }
}

extension UIView: Reusable {}

extension Reusable where Self: UIView {

    /// Returns the reusable identifier named as class name.
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionView {

    /// Register a nib file for use in creating new collection view cells.
    ///
    /// - Parameter _: A type of CollectionViewCell
    public func register<T: UICollectionViewCell>(_: T.Type) {
        register(T.nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }

    /// Returns a reusable cell object located by its identifier
    ///
    /// - Parameter indexPath: The index path specifying the location of the cell.
    /// - Returns: A valid UICollectionReusableView object.
    public func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
}

extension UITableView {

    /// Registers a nib object containing a cell with the table view under a specified identifier.
    ///
    /// - Parameter _: A type of TableViewCell
    public func register<T: UITableViewCell>(_: T.Type) {
        register(T.nib, forCellReuseIdentifier: T.reuseIdentifier)
    }

    /// Registers a nib object containing a header or footer with the table view under a specified identifier.
    ///
    /// - Parameter _: A type of CollectionViewCell
    public func registerHeaderFooter<T: UIView>(_: T.Type) {
        register(T.nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }

    /// Returns a reusable table-view cell object for the specified reuse identifier and adds it to the table.
    ///
    /// - Parameter indexPath: The index path specifying the location of the cell.
    /// - Returns: A UITableViewCell object with the associated reuse identifier. This method always returns a valid cell.
    public func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }

    /// Returns a reusable header or footer view located by its identifier.
    ///
    /// - Returns: A UITableViewHeaderFooterView object with the associated identifier or nil if no such object exists in the reusable view queue.
    public func dequeuReusableHeaderFooter<T: UITableViewHeaderFooterView>() -> T {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("Could not dequeue header footer view with identifier: \(T.reuseIdentifier)")
        }
        return view
    }
}
