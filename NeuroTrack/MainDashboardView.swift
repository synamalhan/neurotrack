//
//  MainDashboardView.swift
//  NeuroTrack
//
//  Created by Syna Malhan on 6/23/25.
//


import SwiftUI

struct MainDashboardView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Text("Welcome to NeuroTrack")
                    .font(.largeTitle)
                    .bold()

                NavigationLink("🧠 Start Brain Training") {
                    GameView()
                }

                NavigationLink("📈 Cognitive Progress") {
                    Text("Coming Soon") // Placeholder for charts
                }

                Spacer()
            }
            .padding()
        }
    }
}
