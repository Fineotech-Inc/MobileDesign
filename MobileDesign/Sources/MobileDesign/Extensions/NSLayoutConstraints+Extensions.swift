import UIKit

/*
 The below enum is used to define the different layout constraints into the following two cases:
 1. When the attribute is relative to another constraint eg: leading, trailing
 2. When the attribute can be defined by a constant value eg: width, height
 This is then used by the NSLayoutConstraint's extension to define the constraint itself
 */
public enum LayoutAnchor {
    case constant(attribute: NSLayoutConstraint.Attribute,
                  constant: CGFloat)
    
    case relative(attribute: NSLayoutConstraint.Attribute,
                  relatedTo: NSLayoutConstraint.Attribute,
                  constant: CGFloat)
    
    case relativeSafeArea(attribute: NSLayoutConstraint.Attribute,
                          relation: NSLayoutConstraint.Relation,
                          relatedTo: NSLayoutConstraint.Attribute,
                          multiplier: CGFloat,
                          constant: CGFloat)
}

extension LayoutAnchor {
    static let leading = relative(attribute: .leading)
    static let trailing = relative(attribute: .trailing)
    static let top = relative(attribute: .top)
    static let bottom = relative(attribute: .bottom)
    
    static let centerX = relative(attribute: .centerX)
    static let centerY = relative(attribute: .centerY)
    
    static let width = constant(attribute: .width)
    static let height = constant(attribute: .height)
    
    static func constant(
        attribute: NSLayoutConstraint.Attribute) -> (_ constant: CGFloat) -> LayoutAnchor
    {
        return { constant in
            .constant(attribute: attribute, constant: constant)
        }
    }
    
    static func relative(attribute: NSLayoutConstraint.Attribute) -> (_ constant: CGFloat, _ relatedTo: NSLayoutConstraint.Attribute) -> LayoutAnchor {
        return { constant, relatedTo in
            .relative(attribute: attribute, relatedTo: relatedTo, constant: constant)
        }
    }
    
    static func relativeSafeArea(attribute: NSLayoutConstraint.Attribute,
                                 relation: NSLayoutConstraint.Relation,
                                 relatedTo: NSLayoutConstraint.Attribute,
                                 multiplier: CGFloat = 1.0) -> (CGFloat) -> LayoutAnchor
    {
        return { constant in
            .relativeSafeArea(attribute: attribute,
                              relation: relation,
                              relatedTo: relatedTo,
                              multiplier: multiplier,
                              constant: constant)
        }
    }
}

/*
 The below extension of NSLayoutConstraint makes it easier to initialize constraints. The activate function of the UIView calls the below convinience init to initialize the constraints
 */
public extension NSLayoutConstraint {
    convenience init(from: UIView, to item: UIView, anchor: LayoutAnchor) {
        switch anchor {
        case let .constant(attribute: attr,
                           constant: constant):
            self.init(
                item: from,
                attribute: attr,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1,
                constant: constant
            )
        case let .relative(attribute: attr,
                           relatedTo: relatedTo,
                           constant: constant):
            self.init(
                item: from,
                attribute: attr,
                relatedBy: .equal,
                toItem: item,
                attribute: relatedTo,
                multiplier: 1,
                constant: constant
            )
        case let .relativeSafeArea(attribute: attr,
                                   relation: relation,
                                   relatedTo: relatedTo,
                                   multiplier: multiplier,
                                   constant: constant):
            let safeAreaLayoutGuide = item.safeAreaLayoutGuide
                    
            self.init(item: from,
                      attribute: attr,
                      relatedBy: relation,
                      toItem: safeAreaLayoutGuide,
                      attribute: relatedTo,
                      multiplier: multiplier,
                      constant: constant)
        }
    }
}
