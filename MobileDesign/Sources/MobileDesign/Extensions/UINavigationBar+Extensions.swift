import Foundation

extension UINavigationBar {

    public func applyLargeNavigationStyle() {
        guard #available(iOS 13.0, *), let theme = PlatformUI.shared.platformTheme else { return }
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = theme.tintColor
        prefersLargeTitles = true
        navBarAppearance.titleTextAttributes = [.foregroundColor: theme.navigationBarTextAttributes.color, .font: theme.navigationBarTextAttributes.font]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: theme.largeNavigationBarTextAttributes.color, .font: theme.largeNavigationBarTextAttributes.font]
        isTranslucent = true
        standardAppearance = navBarAppearance
        scrollEdgeAppearance = navBarAppearance
    }
}
