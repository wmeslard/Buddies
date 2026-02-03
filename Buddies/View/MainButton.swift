//
//  MainButton.swift
//  Buddies
//
//  Created by William ADEO on 23/04/2025.
//

import SwiftUI

struct MainButton: View {
    let content: String
    let picto: String
    let width: CGFloat
    let clipShape: Bool
    let onClick: () -> Void
    var body: some View {
        Button(action: {
            onClick()
        }) {
            VStack {
                Image(systemName:picto)
                    .imageScale(.large)
                    .clipShape(clipShape ? AnyShape(Circle()) : AnyShape(Rectangle()))
                Text(content)
                    .font(.callout)
            }
            .padding(2)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .frame(width: width)
    }
}
