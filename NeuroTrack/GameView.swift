import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    @State private var sessionStart = Date()

    var body: some View {
        VStack {
            Text("🧠 Memory Match")
                .font(.title)
                .padding()

            Text("Score: \(viewModel.score)")
                .font(.headline)

            GridView(items: viewModel.cards, columns: 4) { card in
                Button {
                    viewModel.flipCard(card)
                } label: {
                    Text(card.isFlipped || card.isMatched ? card.symbol : "❓")
                        .font(.largeTitle)
                        .frame(width: 60, height: 60)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(8)
                }
                .disabled(card.isMatched)
            }

            Button("Restart") {
                viewModel.resetGame()
                sessionStart = Date()
            }
            .padding()

            Button("Finish & Save to HealthKit") {
                let end = Date()
                HealthKitManager.shared.logMindfulnessSession(start: sessionStart, end: end)
            }
            .padding()
        }
        .onAppear {
            // ✅ This is the safe place to request HealthKit access
            HealthKitManager.shared.requestAuthorization { success in
                if success {
                    print("✅ HealthKit Authorized")
                } else {
                    print("❌ Authorization Failed")
                }
            }
        }
    }
}
