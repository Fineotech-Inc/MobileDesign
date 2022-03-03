import Foundation

extension UIToolbar {

    public static func create(target: AnyObject, selector: Selector, title: String) -> UIToolbar {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.setItems([UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
                          UIBarButtonItem(title: title, style: .plain, target: target, action: selector)],
                         animated: false)
        return toolbar
    }
}
