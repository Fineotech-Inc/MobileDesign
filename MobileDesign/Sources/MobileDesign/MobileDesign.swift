import Foundation

public struct MobileDesign {
    public private(set) var text = "Hello, World!"

    public init() {
    }
    
    public static var platformBundle: Bundle = Bundle.main
    
    /// Shared instance of PlatformUI
    public static var shared: MobileDesign = MobileDesign()

}
