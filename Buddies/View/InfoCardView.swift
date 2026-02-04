//
//  InfoCardView.swift
//  Buddies
//
//  Created by Willotte on 04/02/2026.
//

import SwiftUI

struct InfoCardView: View {
    let content: [String]
    let picto: String
    let width: CGFloat

    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: picto)
                .foregroundStyle(.white)
            Text(content.joined(separator: " "))
                .foregroundStyle(.white)
                .font(.system(size: 16, weight: .medium, design: .rounded))
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 6)
        .frame(width: width, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.black)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                )
        )
    }
}
#Preview("Default") {
    InfoCardView(
        content: ["42", "amis", "à proximité"],
        picto: "person.2.fill",
        width: 220
    )
    .background(Color.black)
    .padding()
}

#Preview("Compact") {
    InfoCardView(
        content: ["En ligne"],
        picto: "dot.radiowaves.left.and.right",
        width: 160
    )
    .background(Color.black)
    .padding()
}

#Preview("Long text") {
    InfoCardView(
        content: ["Vous avez", "12", "nouvelles", "notifications", "non lues"],
        picto: "bell.fill",
        width: 280
    )
    .background(Color.black)
    .padding()
}

