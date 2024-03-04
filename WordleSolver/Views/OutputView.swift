//
//  OutputView.swift
//  WordleSolver
//
//  Created by Steph on 3/3/24.
//

import SwiftUI

struct OutputView: View {
    @State private var searchText = ""

    var words: [(String, Int)]

    var filteredWords: [(String, Int)] {
        if searchText.isEmpty {
            return words
        }
        return words.filter { $0.0.contains(searchText) }
    }

    var body: some View {
        List(filteredWords, id: \.0) { (word, score) in
            OutputRowView(word: word, score: score)
        }
        .searchable(text: $searchText)
        .autocorrectionDisabled()
    }
}
