//
//  GridView.swift
//  NeuroTrack
//
//  Created by Syna Malhan on 6/23/25.
//


import SwiftUI

struct GridView<Item: Identifiable, Content: View>: View {
    let items: [Item]
    let columns: Int
    let content: (Item) -> Content

    var body: some View {
        let rows = (items.count + columns - 1) / columns
        return VStack(spacing: 10) {
            ForEach(0..<rows, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(0..<self.columns, id: \.self) { column in
                        if let item = self.itemAt(row: row, column: column) {
                            self.content(item)
                        } else {
                            Spacer()
                                .frame(width: 60, height: 60)
                        }
                    }
                }
            }
        }
    }

    func itemAt(row: Int, column: Int) -> Item? {
        let index = row * columns + column
        return index < items.count ? items[index] : nil
    }
}
