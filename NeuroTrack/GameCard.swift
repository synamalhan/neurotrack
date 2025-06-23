//
//  GameCard.swift
//  NeuroTrack
//
//  Created by Syna Malhan on 6/23/25.
//


import Foundation

struct GameCard: Identifiable {
    let id = UUID()
    let symbol: String
    var isFlipped = false
    var isMatched = false
}
