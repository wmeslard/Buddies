import SwiftUI

struct CountdownView: View {
    let targetHour: Int
    @State private var timeRemaining: String = "00:00:00"
    
    var body: some View {
        LiquidGlassContainer(cornerRadius: DS.Radius.pill) {
            Text(timeRemaining)
                .font(.system(size: DS.FontSize.xl, weight: .bold, design: .rounded))
                .foregroundColor(.white)
                .padding(.horizontal, DS.Padding.badgeHorizontal * 1.5)
                .padding(.vertical, DS.Padding.badgeVertical)
                .frame(maxHeight: 30)
        }
        .onAppear {
            updateCountdown()
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                updateCountdown()
            }
        }
    }
    
    private func updateCountdown() {
        let calendar = Calendar.current
        let now = Date()
        
        guard let target = calendar.date(bySettingHour: targetHour, minute: 0, second: 0, of: now) else {
            return
        }
        
        let targetDate = target > now ? target : calendar.date(byAdding: .day, value: 1, to: target)!
        let components = calendar.dateComponents([.hour, .minute, .second], from: now, to: targetDate)
        
        timeRemaining = String(format: "%02d:%02d:%02d",
                              components.hour ?? 0,
                              components.minute ?? 0,
                              components.second ?? 0)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        CountdownView(targetHour: 13)
    }
}
