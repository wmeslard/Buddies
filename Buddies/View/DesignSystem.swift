import SwiftUI

// Global design system tokens
enum DS {
    enum Spacing {
        static let xs: CGFloat = 4
        static let sm: CGFloat = 8
        static let md: CGFloat = 12
        static let lg: CGFloat = 16
        static let xl: CGFloat = 24
    }

    enum Sizes {
        static let controlHeightSm: CGFloat = 36
        static let iconSm: CGFloat = 16
        static let iconMd: CGFloat = 20
    }

    enum Padding {
        // Default badge paddings used inside LiquidGlass containers
        static let badgeVertical: CGFloat = 4
        static let badgeHorizontal: CGFloat = 12

        // Screen/container paddings
        static let containerHorizontal: CGFloat = 12
        static let containerTop: CGFloat = 8
    }

    enum Fonts {
        static let countdown: Font = .system(size: 18, weight: .bold, design: .rounded)
        static let counterValue: Font = .system(size: 16, weight: .bold)
        static let counterLabel: Font = .system(size: 11)
    }
    
    struct Radius {
        static let sm: CGFloat = 12
        static let md: CGFloat = 16
        static let lg: CGFloat = 20
        static let pill: CGFloat = 100  // Pour capsule arrondie
        static let circle: CGFloat = 100  // Pour cercle parfait
    }
    
    struct FontSize {
        static let xs: CGFloat = 10
        static let sm: CGFloat = 12
        static let md: CGFloat = 14
        static let lg: CGFloat = 16
        static let xl: CGFloat = 20
        static let xxl: CGFloat = 24
    }
}
