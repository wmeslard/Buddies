//
//  ActionButtonView.swift
//  Buddies
//
//  Created by William ADEO on 08/05/2025.
//

import SwiftUI

struct ActionButtonView: View {
    @Binding var buttonClicked: Bool
    let width: CGFloat
    let picto: String
    var body: some View {
        HStack {
            Button(action: {
                buttonClicked = true
            }) {
                VStack {
                    Image(systemName: picto)
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
                .frame(width: width)
                .foregroundColor(.white)
                .contentShape(Rectangle())
            }
        }
    }
}

#Preview {
    ActionButtonView(
        buttonClicked: .constant(false),
        width: 50,
        picto: "person.fill.badge.plus")
        .background(.black)
}
