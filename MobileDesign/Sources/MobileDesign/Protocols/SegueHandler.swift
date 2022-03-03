import Foundation

public protocol SegueHandler {

    /// A string type of enum conforming RawRepresentable. Each case represents the next page/screen navigating from a current page.
    ///
    /// - Example:
    ///
    /// ````swift
    /// enum SegueIdentifier: String {
    ///    case detail = "DetailViewController"
    /// }
    /// ````
    associatedtype SegueIdentifier: RawRepresentable
}

extension SegueHandler where Self: UIViewController, SegueIdentifier.RawValue == String {

    /// Initiates the segue with the specified identifier from the current view controller's storyboard file.
    ///
    /// - Parameters:
    ///   - segueIdentifier: The enum of SegueIdentifier that identifies the triggered segue.
    ///   - sender: The object that you want to use to initiate the segue.
    public func performSegue(withIdentifier segueIdentifier: SegueIdentifier, sender: Any? = nil) {
        performSegue(withIdentifier: segueIdentifier.rawValue, sender: sender)
    }

    /// Returns a SegueIdentifier enum corresponding to the identifier for the segue object.
    ///
    /// - Parameter segue: A UIStoryboardSegue object that prepares for and performs the visual transition between two view controllers.
    /// - Returns: The enum of SegueIdentifier that identifies the triggered segue.
    public func segueIdentifier(forSegue segue: UIStoryboardSegue) -> SegueIdentifier {
        guard let identifier = segue.identifier, let segueIdentifier = SegueIdentifier(rawValue: identifier) else {
            fatalError("Invalid segue identifier \(String(describing: segue.identifier)).")
        }
        return segueIdentifier
    }
}
