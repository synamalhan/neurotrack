//
//  NeuroTrackApp.swift
//  NeuroTrack
//
//  Created by Syna Malhan on 6/23/25.
//

import SwiftUI

@main
struct NeuroTrackApp: App {
    init() {
        HealthKitManager.shared.requestAuthorization { success in
            print("HealthKit auth status: \(success)")
        }
    }

    var body: some Scene {
        WindowGroup {
            MainDashboardView()
        }
    }
}
