import Foundation

public extension UITextView {

    static func create(text: StringsAttributable, isScrollEnabled: Bool = false, isEditable: Bool = false, textAlignment: NSTextAlignment = .left, dataDetectorTypes: UIDataDetectorTypes = .all) -> UITextView {
        let textView = UITextView()
        textView.textAlignment = textAlignment
        textView.configure(text: text)
        textView.isScrollEnabled = isScrollEnabled
        textView.isEditable = isEditable
        textView.dataDetectorTypes = dataDetectorTypes
        return textView
    }
}
