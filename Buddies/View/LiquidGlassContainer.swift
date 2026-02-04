import SwiftUI

public struct LiquidGlassContainer<Content: View>: View {
    private let cornerRadius: CGFloat
    private let paddingInsets: EdgeInsets?
    private let contentBuilder: () -> Content

    public init(cornerRadius: CGFloat = 10,
                padding: EdgeInsets? = nil,
                @ViewBuilder content: @escaping () -> Content) {
        self.cornerRadius = cornerRadius
        self.paddingInsets = padding
        self.contentBuilder = content
    }

    public var body: some View {
        Group {
            if #available(iOS 26.0, *) {
                contentBuilder()
                    .padding(paddingInsets ?? EdgeInsets(top: 6, leading: 10, bottom: 6, trailing: 10))
                    .glassEffect(.regular.tint(.white.opacity(0.08)), in: .rect(cornerRadius: cornerRadius))
            } else {
                contentBuilder()
                    .padding(paddingInsets ?? EdgeInsets(top: 6, leading: 10, bottom: 6, trailing: 10))
                    .background(
                        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                            .fill(.ultraThinMaterial)
                            .overlay(
                                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                                    .strokeBorder(Color.white.opacity(0.15), lineWidth: 1)
                                    .blendMode(.overlay)
                            )
                            .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 4)
                    )
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        LiquidGlassContainer {
            HStack(spacing: 8) {
                Image(systemName: "clock.fill")
                    .foregroundStyle(.white)
                Text("12 : 34 : 56")
                    .font(.system(size: 24, weight: .medium, design: .rounded))
                    .foregroundStyle(.white)
                Text("|")
                    .foregroundStyle(.white.opacity(0.6))
                Image(systemName: "star.fill")
                    .foregroundStyle(.white)
                VStack(spacing: 0) {
                    Text("0")
                        .foregroundStyle(.white)
                        .font(.system(size: 16, weight: .bold))
                    Text("jour")
                        .foregroundStyle(.white.opacity(0.6))
                        .font(.system(size: 12))
                }
            }
        }
    }
}
