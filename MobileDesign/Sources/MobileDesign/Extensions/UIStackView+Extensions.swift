import Foundation

public extension UIStackView {
    
    func removeSubview(_ subView: UIView) {
        self.removeArrangedSubview(subView)
        subView.removeFromSuperview()
    }

    func applyConstraints(to view: UIView) {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    /// Swaps the First and Second views in the Stack View.
    func swapFirstAndSecondViews() {
        guard let firstView = subviews.first else { return }
        removeArrangedSubview(firstView)
        insertArrangedSubview(firstView, at: 1)
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    /// Adds an array of arranged subviews to the stack view.
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach {
            addArrangedSubview($0)
        }
    }
}
