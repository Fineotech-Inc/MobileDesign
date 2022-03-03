import Foundation

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
    public convenience init(sixDigitHex hex: UInt32, alpha: CGFloat = 1) {
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
    public convenience init(eightDigitHex hex: UInt32) {
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
        var rgb: UInt32 = 0
        guard Scanner(string: hexString).scanHexInt32(&rgb) else {
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
            print(UIColorError.invalidHex(rgb).localizedDescription)
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
    
    // MARK: - Blacks
    static var fidoBlackColor: UIColor {
        return UIColor(red:0, green:0, blue:0)
    }
    
    // MARK: - Blues
    static var fidoLightBlueColor: UIColor {
        return UIColor(red:45, green:115, blue:255)
    }
    
    static var fidoSelectedBlueColor: UIColor {
        return UIColor(red:79, green:133, blue:139)
    }
    
    static var fidoTealColor: UIColor {
        return UIColor(red:166, green:238, blue:227)
    }
    
    // MARK: - Greens
    static var fidoGreenColor: UIColor {
        return UIColor(red:3, green:93, blue:103)
    }
    
    static var fidoLightGreenColor: UIColor {
        return UIColor(red:0, green:175, blue:171)
    }
    
    // MARK: - Greys
    static var fidoBadgeGreyColor: UIColor {
        return UIColor(red:228, green:238, blue:240)
    }
    
    static var fidoCulturedColor: UIColor {
        return UIColor(red:245, green:245, blue:245)
    }
    
    static var fidoDarkGreyColor: UIColor {
        return UIColor(red:60, green:60, blue:60)
    }
    
    static var fidoGreyColor: UIColor {
        return UIColor(red:91, green:103, blue:112)
    }
    
    static var fidoLighterGreyColor: UIColor {
        return UIColor(red:234, green:233, blue:233)
    }
    
    static var fidoLightGreyColor: UIColor {
        return UIColor(red:149, green:157, blue:166)
    }
    
    /// (R,G,B): (187,187,187)
    static var inactivePageIndicatorColor: UIColor { #colorLiteral(red: 0.7314285636, green: 0.7315150499, blue: 0.7313887477, alpha: 1) }
    
    static var fidoLightGraphLineGreyColor: UIColor {
        return UIColor(red:171, green:171, blue:171)
    }
    
    // MARK: - Reds
    static var fidoRedColor: UIColor {
        return UIColor(red:225, green:40, blue:38)
    }
    
    // MARK: - Yellows
    static var fidoGoldColor: UIColor {
        return UIColor(red:150, green:130, blue:9)
    }
    
    static var fidoYellowColor: UIColor {
        return UIColor(red:255, green:230, blue:0)
    }
    
    // MARK: - Whites
    static var fidoDeselectedWhiteColor: UIColor {
        return UIColor(red:236, green:248, blue:247)
    }
    
    static var fidoWhiteColor: UIColor {
        return UIColor(red:255, green:255, blue:255)
    }
    
    // MARK: - Other
    static var fidoLightSurfCrestColor: UIColor {
        return UIColor(red:225, green:231, blue:222)
    }
    
    static var fidoSurfCrestColor: UIColor {
        return UIColor(red:195, green:207, blue:189)
    }
    
    static var fidoRefreshControlBackgroundColor: UIColor {
        return UIColor(red:182, green:236, blue:227)
    }
    
    static var fidoTealBlueColor: UIColor {
        return UIColor(red:3, green:93, blue:103)
    }
    
    static var fidoTapStateColor: UIColor {
        return UIColor(red:222, green:250, blue:239)
    }
    
    static var fidoSubHeaderGreyColor: UIColor {
        return UIColor(red: 151, green: 151, blue: 151)
    }
    
    static var fidoUsageWarningColor: UIColor {
        return UIColor(red: 255, green: 191, blue: 63)
    }
    
    static var fidoOverageWarningColor: UIColor {
        return UIColor(red: 255, green: 250, blue: 204)
    }
}

extension UIColor {
    
    static var rogersBlack: UIColor {
        return UIColor(red: 31.0/255.0, green: 31.0/255.0, blue: 31.0/255.0, alpha: 1.0)
    }
    
    static var rogersGrey: UIColor {
        return UIColor(red:31, green:31, blue:31)
    }

    static var rogersBorderGrey: UIColor {
        return UIColor(red:221, green:221, blue:221)
    }
    
    static var rogersRed: UIColor {
        return UIColor(red: 218, green: 41, blue: 28)
    }

    static var rogersFontRed: UIColor {
        return UIColor(red: 202, green: 62, blue: 0)
    }
    
    static var rogersTealBlue: UIColor {
        return UIColor(red: 47, green: 111, blue: 167)
    }
}

extension UIColor {
    
    var image: UIImage {
        return image(withSize: CGSize(width: 1, height: 1))
    }
}
