//
//  UIImage+Extensions.swift
//  PlatformUI
//
//  Created by Amala Muthukumar on 2020-11-04.
//  Copyright © 2020 Rogers Communication Inc. All rights reserved.
//

import Foundation

public extension UIImage {

    /// Returns a UIImage, tinted with a UIColor.
    func tint(withColor color: UIColor) -> UIImage? {
        let image = withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: image)
        imageView.tintColor = color

        UIGraphicsBeginImageContextWithOptions(image.size, false, 0.0)
        guard let context = UIGraphicsGetCurrentContext() else { return self }
        imageView.layer.render(in: context)
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return tintedImage
    }
}
