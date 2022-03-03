import UIKit

extension UIColor {

    /// Initializes and returns a color object using the specified opacity and RGB component values as an integer.
    ///
    /// - ex1):
    /// ````swift
    /// UIColor(red: 120, green: 200, blue: 155)
    /// ````
    ///
    /// - ex2):
    /// ````swift
    /// UIColor(red: 120, green: 200, blue: 155, alpha: 0.5)
    /// ````
    ///
    /// - Parameters:
    ///   - red: The red value of the color object as an integer value.
    ///   - green: The green value of the color object as an integer value.
    ///   - blue: The blue value of the color object as an integer value.
    ///   - alpha: The opacity value of the color object as an integer value.
    public convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    /// From six digit hexadecimal to UIColor
    ///
    /// - Parameters:
    ///   - sixDigitHex: Six digit hexadecimal. ex) #000000, #AABBCC
    ///   - alpha: Alpha value(0.0 ~ 1.0). The default is 1.0
    public convenience init(sixDigitHex hex: UInt64, alpha: CGFloat = 1) {
        self.init(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(hex & 0x0000FF) / 255.0,
                  alpha: alpha)
    }

    /// From eight digit hexadecimal to UIColor
    ///
    /// - Parameters:
    ///   - eightDigitHex: Eight digit hexadecimal. ex) #000000FF, #AABBCCFF
    ///   - alpha: Alpha value(0.0 ~ 1.0). The default is 1.0
    public convenience init(eightDigitHex hex: UInt64) {
        self.init(red: CGFloat((hex & 0xFF000000) >> 24) / 255.0,
                  green: CGFloat((hex & 0x00FF0000) >> 16) / 255.0,
                  blue: CGFloat((hex & 0x0000FF00) >> 8) / 255.0,
                  alpha: CGFloat(hex & 0x000000FF) / 255.0)
    }

    /// From hexadecimal string to UIColor
    ///
    /// - Parameters:
    ///   - hex: String type of hexadecimal "#AABBCC", "#AABBCCDD", "FFFFFF", "FFFFFF00"
    ///   - alpha: Alpha value(0.0 ~ 1.0). The default is 1.0 However, if it's 8-digit hexadecimal it'll be ignored.
    ///   - defaultColor: Default color if it's error. The alpha value will be ignored.
    public convenience init(hexString hex: String, alpha: CGFloat = 1, defaultColor: UIColor = UIColor.clear) {
        let hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        guard Scanner(string: hexString).scanHexInt64(&rgb) else {
            self.init(cgColor: defaultColor.cgColor)
            print(UIColorError.failToScanHex(hexString).localizedDescription)
            return
        }

        switch hexString.count {
        case 6:
            self.init(sixDigitHex: rgb, alpha: alpha)
        case 8:
            self.init(eightDigitHex: rgb)
        default:
            self.init(cgColor: defaultColor.cgColor)
        }
    }
}

extension UIColor {
    
    /// Creates an instance of UIImage with a given size
    ///
    /// - Parameter size: A size of image
    /// - Returns: An instance of UIImage
    public func image(withSize size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }

    /// Returns a string of hex value
    ///
    /// - Returns: a string of hex value
    public var hexString: String {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        getRed(&red, green: &green, blue: &blue, alpha: nil)
        red *= 255.0
        green *= 255.0
        blue *= 255.0
        return String(format: "%02X%02X%02X", Int(red), Int(green), Int(blue))
    }
}

private enum UIColorError: Error {

    case invalidHex(UInt32)
    case failToScanHex(String)
}

extension UIColorError: LocalizedError {

    fileprivate var errorDescription: String? {
        switch self {
        case .invalidHex(let hex):
            return "Invalid Hex: \(hex)"
        case .failToScanHex(let hex):
            return "Unable to scan for \(hex)"
        }
    }
}

extension UIColor {
    
    var image: UIImage {
        return image(withSize: CGSize(width: 1, height: 1))
    }
}
