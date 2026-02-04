import SwiftUI

struct CameraView: View {
    @Binding var isNavigating: Bool
    @StateObject private var cameraManager = CameraManager()
    private let targetHour = 13

    var body: some View {
        ZStack {
            // Background: Camera preview sur toute la hauteur
            CameraPreviewView(session: cameraManager.session)
                .ignoresSafeArea()
            
            // Header overlay
            VStack {
                headerView
                    .padding(.horizontal, DS.Padding.containerHorizontal)
                    .padding(.top, DS.Padding.containerTop)
                
                Spacer()
            }
        }
        .onAppear {
            cameraManager.startSession()
        }
        .onDisappear {
            cameraManager.stopSession()
        }
    }
    
    private var headerView: some View {
        ZStack {
            // Left: days counter
            HStack {
                DaysCounterView(days: 134, emoji: "🦄")
                    .frame(height: DS.Sizes.controlHeightSm)
                Spacer()
            }
            
            // Center: countdown
            CountdownView(targetHour: targetHour)
            
            // Right: notification button
            HStack {
                Spacer()
                NotificationButton()
            }
        }
        .frame(height: DS.Sizes.controlHeightSm)
    }
}

#Preview {
    CameraView(isNavigating: .constant(false))
        .background(.black)
}
