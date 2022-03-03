import Foundation
import UIKit

public extension UICollectionView {
    
    /// Scrolls to the nearest Collection View Cell for custom Page Control.
    /// Based on code from [Vahid Amiri on StackOverFlow](https://stackoverflow.com/a/48572117)
    func scrollToNearestVisibleCollectionViewCell(offset: CGFloat = 0) {
        decelerationRate = .fast
        let visibleCenterPositionOfScrollView = Float(contentOffset.x + (bounds.size.width / 2))
        var closestCellIndex = -1
        var closestDistance: Float = .greatestFiniteMagnitude
        for i in 0..<visibleCells.count {
            let cell = visibleCells[i]
            let cellWidth = cell.bounds.size.width
            let cellCenter = Float(cell.frame.origin.x + (cellWidth + offset) / 2)

            // Now calculate closest cell
            let distance: Float = fabsf(visibleCenterPositionOfScrollView - cellCenter)
            if distance < closestDistance, let indexPath = indexPath(for: cell) {
                closestDistance = distance
                closestCellIndex = indexPath.row
            }
        }
        if closestCellIndex != -1 {
            scrollToItem(at: IndexPath(row: closestCellIndex, section: 0), at: .left, animated: true)
        }
    }
}

