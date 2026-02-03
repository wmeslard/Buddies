//
//  CameraView.swift
//  Buddies
//
//  Created by William ADEO on 23/04/2025.
//

import SwiftUI

struct CameraView: View {
    @Binding var isNavigating: Bool
    @State private var timeRemainingString = ""
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    private func updateTimeRemaining() {
        let calendar = Calendar.current
        let now = Date()
        let todayEightPM = calendar.date(bySettingHour: 20, minute: 0, second: 0, of: now)!

        let targetDate = now > todayEightPM
            ? calendar.date(byAdding: .day, value: 1, to: todayEightPM)!
            : todayEightPM

        let components = calendar.dateComponents([.hour, .minute, .second], from: now, to: targetDate)
        let h = String(format: "%02d", components.hour ?? 0)
        let m = String(format: "%02d", components.minute ?? 0)
        let s = String(format: "%02d", components.second ?? 0)

        timeRemainingString = "\(h) : \(m) : \(s)"
    }

    var body: some View {
        GeometryReader { geometry in
            HStack {
                Button(action: {
                    isNavigating = true
                }) {
                    VStack {
                        Image(systemName: "person.fill.badge.plus")
                            .imageScale(.large)
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.black)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                                    )
                            )
                    }
                    .frame(width: geometry.size.width / 8)
                    .foregroundColor(.white)
                    .contentShape(Rectangle())
                }
                ActionButtonView(
                    buttonClicked: Binding<Bool>,
                    width: geometry.size.width / 8,
                    picto: "person.fill.badge.plus")
                InfoCardView(
                    content: [teammate.birth, "-", teammate.death],
                    picto: "calendar",
                    width: geometry.size.width/4)
                Spacer()
                HStack() {
                    Text(timeRemainingString)
                        .font(.system(size: 24, weight: .medium, design: .rounded))
                        .foregroundColor(.white)

                    Text("|")
                        .foregroundColor(Color.gray.opacity(0.6))

                    Image(systemName: "star.fill")
                        .foregroundColor(.white)

                    VStack(spacing: 2) {
                        Text("0")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                        Text("jour")
                            .foregroundColor(Color.gray.opacity(0.6))
                            .font(.system(size: 14))
                    }
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 2)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                        )
                )
                .onReceive(timer) { _ in
                    updateTimeRemaining()
                }
                
                Spacer()
                Button(action: {
                    isNavigating = true
                }) {
                    VStack {
                        Image(systemName: "message")
                            .imageScale(.large)
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.black)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                                    )
                            )
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 2)
                    .frame(width: geometry.size.width / 8)
                    .foregroundColor(.white)
                    .contentShape(Rectangle())
                }
            }
        }
    }
}

#Preview {
    CameraView(isNavigating: .constant(false))
        .background(.black)
}
