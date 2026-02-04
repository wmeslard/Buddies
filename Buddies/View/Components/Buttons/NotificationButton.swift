//
//  NotificationButton.swift
//  Buddies
//
//  Created by Willotte on 04/02/2026.
//

import SwiftUI

struct NotificationButton: View {
    @State private var isFavorite = false
    
    var body: some View {
        LiquidGlassContainer(cornerRadius: DS.Radius.circle) {
            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                    isFavorite.toggle()
                }
            } label: {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: DS.Sizes.iconMd, height: DS.Sizes.iconMd)
                    .foregroundColor(.white)
                    .frame(width: DS.Sizes.controlHeightSm, height: DS.Sizes.controlHeightSm)
            }
            .frame(maxHeight: 30)
        }
        .frame(width: DS.Sizes.controlHeightSm, height: DS.Sizes.controlHeightSm)
    }
}
