import UIKit

public extension String {
    
    /// The special characters allowed in a password.
    static var passwordSpecialCharactersAllowed: String { "!@#$" }

    /// Check if a regular expression is valid on a String.
    func isRegularExpressionValid(for regularExpression: String) -> Bool {
        let test = NSPredicate(format:"SELF MATCHES %@", regularExpression)
        return test.evaluate(with: self)
    }
    
    /// Check if a set of alpha numeric characters is valid.
    func isValidAlphaNumericSet(specialCharacters: String) -> Bool {
        let regEx = "^[a-zA-Z0-9\(specialCharacters)]+$"
        return isRegularExpressionValid(for: regEx)
    }

    /// Check if a Date is valid.
    func isValidDate(dateFormat: String = "yyyy-MM-dd") -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.date(from: self) != nil
    }
    
    /// Check if an E-mail is valid.
    var isValidEmail: Bool {
        let regEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        return isRegularExpressionValid(for: regEx)
    }
    
    /// Check if a set of numbers is valid.
    var isValidSetOfNumbers: Bool {
        let regEx = "^[0-9]*$"
        return isRegularExpressionValid(for: regEx)
    }
    
    /// Check if a password is valid.
    var isValidPassword: Bool {
        let regEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d!@#$]{8,64}$"
        return isRegularExpressionValid(for: regEx)
    }
    
    /// Check if a Canadian Postal Code is valid.
    var isValidPostalCode: Bool {
        let regEx = "^(?!.*[DdFfIiOoQqUu])[A-VXYa-vxy][0-9][A-Za-z] ?[0-9][A-Za-z][0-9]$"
        return isRegularExpressionValid(for: regEx)
    }

    /// Masks the phone number except the first and last 2 digits of the number.
    var maskedPhoneNumber: String {
        var phoneNumber = ""
        for (index, element) in components(separatedBy: CharacterSet.decimalDigits.inverted).joined().enumerated() {
            switch index {
            case 1, 3, 4, 6, 7:
                phoneNumber.append("*")
            case 2, 5:
                phoneNumber.append("*")
                phoneNumber.append("-")
            default:
                phoneNumber.append(element)
            }
        }
        return phoneNumber
    }

    /// Masks the email address except the first and last characters of the local part.
    /// Example: johnsmith@gmail.com is masked as j******h@gmail.com
    var maskedEmailAddress: String {
        let components = self.components(separatedBy: "@")
        guard let local = components.first, let domain = components.last else { return self }
        return local.maskedMiddleCharacters + "@" + domain
    }

    /// Masks the characters except the first and last character.
    var maskedMiddleCharacters: String {
        String(enumerated().map { index, char in
           [0, count - 1].contains(index) ? char : "*"
        })
    }

    /// Formats the phone number with dashes
    var formattedPhoneNumberWithDashes: String {
        var formatted = self
        formatted.insert("-", at: index(endIndex, offsetBy: -4))
        formatted.insert("-", at: index(endIndex, offsetBy: -7))
        if count >= 11 { formatted.insert("-", at: index(endIndex, offsetBy: -10)) }
        return formatted
    }
}
