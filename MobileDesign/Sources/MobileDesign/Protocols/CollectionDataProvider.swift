import UIKit

public protocol CollectionDataProvider {

    associatedtype T
    var isEmpty: Bool { get }
    var numberOfCellsInRow: Int { get }
    var numberOfSections: Int { get }
    func numberOfItems(in section: Int) -> Int
    func item(at indexPath: IndexPath) -> T?
}
