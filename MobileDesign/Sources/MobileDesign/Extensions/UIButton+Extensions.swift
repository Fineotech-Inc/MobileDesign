import UIKit

public extension UIButton {

    static func create(type: UIButton.ButtonType = .custom, font: UIFont? = nil, normalTextColor: UIColor? = nil, disabledTextColor: UIColor? = nil) -> UIButton {
        let button = UIButton(type: type)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentHorizontalAlignment = .left
        button.contentVerticalAlignment = .top
        button.setTitleColor(normalTextColor, for: .normal)
        button.setTitleColor(disabledTextColor, for: .disabled)
        button.titleLabel?.font = font
        return button
    }
    
    func resize(minimumHeight: CGFloat = 44) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(greaterThanOrEqualToConstant: minimumHeight).isActive = true
        titleLabel?.numberOfLines = 0
        titleLabel?.lineBreakMode = .byWordWrapping
        titleLabel?.textAlignment = .center
        sizeToFit()
    }
}
