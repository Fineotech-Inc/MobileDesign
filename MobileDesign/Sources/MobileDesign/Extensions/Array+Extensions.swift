import Foundation

public extension Array where Element: Equatable {

    /// Removes an element from an array
    mutating func remove(element: Element) {
        guard let index = firstIndex(of: element) else { return }
        remove(at: index)
    }

    /// Appends an unique element to an array
    mutating func appendUnique(element: Element) {
        guard !contains(element) else { return }
        append(element)
    }
}

public extension Array {
    
    subscript(safeIndex index: Int) -> Element? {
        guard index >= 0, index < endIndex else { return nil }
        return self[index]
    }
}
