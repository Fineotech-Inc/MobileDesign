import UIKit

public protocol ConfigurableCell: Reusable {
    
    associatedtype T
    
    func configure(_ item: T)
}
