import UIKit
import UIKit

open class ScrollableViewController: UIViewController {
    
    // MARK: - Base Views
    open var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    open var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fill
        view.contentMode = .scaleToFill
        return view
    }()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        customizeView()
        configureBaseViews()
    }

    open func configureBaseViews() {
        view.addSubview(scrollView)

        scrollView.addSubview(stackView)

        let frameGuide = scrollView.frameLayoutGuide
        let contentGuide = scrollView.contentLayoutGuide

        NSLayoutConstraint.activate([
            frameGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            frameGuide.topAnchor.constraint(equalTo: view.topAnchor),
            frameGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            frameGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentGuide.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            contentGuide.topAnchor.constraint(equalTo: stackView.topAnchor),
            contentGuide.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            contentGuide.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            
            contentGuide.widthAnchor.constraint(equalTo: frameGuide.widthAnchor)
        ])
    }
    
    open func configureBaseViewsForContainers() {
        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        scrollView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    public func customizeView(stackViewSpacing: CGFloat = 0.0, backgroundColor: UIColor = .white) {
        stackView.spacing = stackViewSpacing
        view.backgroundColor = backgroundColor
    }
}
