//
//  HealthKitManager.swift
//  NeuroTrack
//
//  Created by Syna Malhan on 6/23/25.
//


import HealthKit

class HealthKitManager {
    static let shared = HealthKitManager()
    private let healthStore = HKHealthStore()

    private init() {}

    // MARK: - Authorization

    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        guard let mindfulType = HKObjectType.categoryType(forIdentifier: .mindfulSession) else {
            completion(false)
            return
        }

        healthStore.requestAuthorization(toShare: [mindfulType], read: [mindfulType]) { success, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("❌ HealthKit authorization failed:", error.localizedDescription)
                }
                completion(success)
            }
        }
    }


    // MARK: - Logging Session

    func logMindfulnessSession(start: Date, end: Date) {
        guard let mindfulType = HKObjectType.categoryType(forIdentifier: .mindfulSession) else { return }

        let sample = HKCategorySample(type: mindfulType, value: 0, start: start, end: end)
        healthStore.save(sample) { success, error in
            if success {
                print("✅ Session saved to HealthKit.")
            } else if let error = error {
                print("❌ Error saving to HealthKit:", error.localizedDescription)
            }
        }
    }
}
