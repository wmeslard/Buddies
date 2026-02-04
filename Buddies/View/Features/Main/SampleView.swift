import SwiftUI

public struct SampleView: View {
    public init() {}

    public var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 16) {
                Text("Sample View")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                Text("Ceci est un exemple de vue.")
                    .foregroundStyle(.secondary)
            }
            .padding()
        }
    }
}

#Preview {
    SampleView()
}
