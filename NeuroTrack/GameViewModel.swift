//
//  GameViewModel.swift
//  NeuroTrack
//
//  Created by Syna Malhan on 6/23/25.
//


import Foundation

class GameViewModel: ObservableObject {
    @Published var cards: [GameCard] = []
    @Published var score: Int = 0

    private var lastFlippedIndex: Int?

    init() {
        resetGame()
    }

    func resetGame() {
        let symbols = ["🧠", "💡", "🎯", "📚"]
        let paired = (symbols + symbols).shuffled()
        cards = paired.map { GameCard(symbol: $0) }
        score = 0
        lastFlippedIndex = nil

    }

    func flipCard(_ card: GameCard) {
        guard let index = cards.firstIndex(where: { $0.id == card.id }), !cards[index].isMatched else { return }

        cards[index].isFlipped.toggle()

        if let lastIndex = lastFlippedIndex, lastIndex != index {
            if cards[lastIndex].symbol == cards[index].symbol {
                cards[lastIndex].isMatched = true
                cards[index].isMatched = true
                score += 10
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.cards[lastIndex].isFlipped = false
                    self.cards[index].isFlipped = false
                }
            }
            lastFlippedIndex = nil
        } else {
            lastFlippedIndex = index
        }
    }
}
