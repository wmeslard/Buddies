import SwiftUI

struct DaysCounterView: View {
    let days: Int
    let emoji: String
    
    var body: some View {
        LiquidGlassContainer(cornerRadius: DS.Radius.pill) {
            HStack(spacing: DS.Spacing.xs) {
                Text(emoji)
                    .font(.system(size: DS.FontSize.md))
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("\(days)")
                        .font(.system(size: DS.FontSize.sm, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("jours")
                        .font(.system(size: DS.FontSize.xs))
                        .foregroundColor(.white.opacity(0.6))
                }
            }
            .padding(.horizontal, 2)
            .padding(.vertical, 1)
            .frame(maxHeight: 30)
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        DaysCounterView(days: 134, emoji: "🦄")
    }
}
