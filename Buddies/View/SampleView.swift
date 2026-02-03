//
//  SampleView.swift
//  Buddies
//
//  Created by William ADEO on 23/04/2025.
//

import SwiftUI

struct SampleView: View {
    var body: some View {
        VStack{
            Text("Hello, World!")
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }

}

#Preview {
    SampleView()
}
