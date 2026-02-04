//
//  NavigationView.swift
//  Buddies
//
//  Created by William ADEO on 22/04/2025.
//

import SwiftUI

struct MainView: View {
    @State private var selectedPage: Int? = nil

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Page overlay behind buttons
                ZStack {
                    if selectedPage == 1 {
                        PageOne()
                            .zIndex(1)
                    }
                    if selectedPage == 2 {
                        PageTwo()
                            .zIndex(1)
                    }
                    if selectedPage == 3 {
                        PageThree()
                            .zIndex(1)
                    }
                }
                .ignoresSafeArea()

                VStack {
                    Spacer()

                    HStack {
                        MainButton(
                            content: "Reveal",
                            picto: "square.grid.2x2.fill",
                            width: geometry.size.width/4,
                            clipShape: true
                        ){ selectedPage = 1 }
                        MainButton(
                            content: "Appareil",
                            picto: "camera.fill",
                            width: geometry.size.width/4,
                            clipShape: false
                        ){ selectedPage = 2 }
                        MainButton(
                            content: "Profil",
                            picto: "person",
                            width: geometry.size.width/4,
                            clipShape: true
                        ){ selectedPage = 3 }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 20)
                    .background(.black)
                }
            }
        }
    }
}

struct PageOne: View {
    @State fileprivate var showSample = false
    var body: some View {
        VStack {
            NavigationStack {
                RevealView(isNavigating: $showSample)
                    .navigationDestination(isPresented: $showSample) {
                        SampleView()
                    }
                    .background(.black)
            }
        }
    }
}

struct PageTwo: View {
    @State fileprivate var showSample = false
    var body: some View {
        VStack {
            NavigationStack {
                CameraView(isNavigating: $showSample)
                    .navigationDestination(isPresented: $showSample) {
                        SampleView()
                    }
                    .background(.black)
            }
        }
    }
}

struct PageThree: View {
    var body: some View {
        Text("This is Page Three")
            .font(.largeTitle)
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 10)
    }
}


#Preview {
    MainView().background(.black)
}
