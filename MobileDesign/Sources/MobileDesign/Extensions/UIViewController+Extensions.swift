import UIKit

@objc public extension UIViewController {

    private func swizzled_present(_ viewControllerToPresent: UIViewController, animated: Bool, completion: (() -> Void)?) {

        if #available(iOS 13.0, *) {
            if viewControllerToPresent.modalPresentationStyle == .automatic || viewControllerToPresent.modalPresentationStyle == .pageSheet {
                viewControllerToPresent.modalPresentationStyle = .fullScreen
            }
        }

        self.swizzled_present(viewControllerToPresent, animated: animated, completion: completion)
    }

    
    @nonobjc private static let _swizzlePresentationStyle: Void = {
        let instance: UIViewController = UIViewController()
        let aClass: AnyClass! = object_getClass(instance)

        let originalSelector = #selector(UIViewController.present(_:animated:completion:))
        let swizzledSelector = #selector(UIViewController.swizzled_present(_:animated:completion:))

        let originalMethod = class_getInstanceMethod(aClass, originalSelector)
        let swizzledMethod = class_getInstanceMethod(aClass, swizzledSelector)

        if let originalMethod = originalMethod, let swizzledMethod = swizzledMethod {
            if !class_addMethod(aClass, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod)) {
                method_exchangeImplementations(originalMethod, swizzledMethod)
            } else {
                class_replaceMethod(aClass, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
            }
        }
    }()

    //Switch the implementation of UIViewController.present to change default modalPresentationStyle of iOS 13 to fullScreen
    //Make sure it's called only once
    @objc static func swizzlePresentationStyle() {
        _ = self._swizzlePresentationStyle
    }
}
