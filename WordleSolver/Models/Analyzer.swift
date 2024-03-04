//
//  Analyzer.swift
//  WordleSolver
//
//  Created by Stephanie Ananth on 3/3/24.
//

import Foundation

actor Analyzer: Sendable {
    private let words: [String]

    init(words: [String]) {
        self.words = words
    }

    var letterFrequencies: [Character: Int] {
        if let letterFrequenciesCache {
            return letterFrequenciesCache
        }

        var letterFrequencies: [Character: Int] = [:]
        for letter in "abcdefghijklmnopqrstuvwxyz" {
            letterFrequencies[letter] = words.filter { $0.contains(letter) }.count
        }
        letterFrequenciesCache = letterFrequencies
        return letterFrequencies
    }
    private var letterFrequenciesCache: [Character: Int]? = nil

    var wordScores: [String: Int] {
        if let wordScoresCache {
            return wordScoresCache
        }

        var wordScores: [String: Int] = [:]
        words.forEach { word in
            wordScores[word] = Set(word).reduce(0, { $0 + (letterFrequencies[$1] ?? 0) })
        }
        wordScoresCache = wordScores
        return wordScores
    }
    private var wordScoresCache: [String: Int]? = nil

    var wordsSortedByScore: [(String, Int)] {
        if let wordsSortedByScoreCache {
            return wordsSortedByScoreCache
        }

        let wordsSortedByScore = wordScores.sorted { ($0.1, $1.0) > ($1.1, $0.0) }
        wordsSortedByScoreCache = wordsSortedByScore
        return wordsSortedByScore
    }
    private var wordsSortedByScoreCache: [(String, Int)]? = nil
}
