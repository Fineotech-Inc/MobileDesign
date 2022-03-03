import UIKit

public protocol NibFileLoadable {

    /// A static computed property to return a UINib instance
    static var nib : UINib { get }
}

extension UIView: NibFileLoadable { }

extension NibFileLoadable where Self: UIView {

    /// Returns a UINib object initialized to the nib file in the default bundle on PlatformUI framework.
    public static var nib : UINib {
        return UINib(nibName: String(describing: self), bundle: MobileDesign.platformBundle)
    }
    
    /// Returns a UINib object initialized to the nib file in the specified bundle.
    ///
    /// - Parameter bundle: The bundle in which to search for the nib file. If you specify nil, this method looks for the nib file in the main bundle.
    /// - Returns: The initialized UINib object. An exception is thrown if there were errors during initialization or the nib file could not be located.
    public static func nib(fromBundle bundle: Bundle? = MobileDesign.platformBundle) -> UINib {
        return UINib(nibName: String(describing: self), bundle: bundle)
    }
    
    /// Unarchives and instantiates the in-memory contents of the receiver’s nib file, creating a top level object.
    ///
    /// - Parameter bundle: The bundle in which to search for the nib file. If you specify nil, this method looks for the nib file in the main bundle.
    /// - Returns: A top-level object from the nib file.
    public static func loadFromNib(fromBundle bundle: Bundle? = MobileDesign.platformBundle) -> Self {
        let identifiedNib = nib(fromBundle: bundle)
        guard let view = identifiedNib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("The nib \(identifiedNib) expected its root view to be of type \(self)")
        }
        return view
    }
    
    /// Unarchives the contents of a nib file located in the receiver's bundle
    ///
    /// - Parameters:
    ///   - instance: A type of UIView having a xib file using same name as the view
    ///   - bundle: The bundle in which to search for the nib file. If you specify nil, this method looks for the nib file in the main bundle.
    /// - Returns: A top-level view from the nib file.
    public func loadNib<Subject>(named instance: Subject, fromBundle bundle: Bundle? = MobileDesign.platformBundle) -> UIView {
        guard let view = bundle?.loadNibNamed(String(describing: instance.self), owner: self, options: nil)?.first as? UIView else {
            fatalError("The nib \(instance) expected its root view to be of type \(self)")
        }
        return view
    }
}
