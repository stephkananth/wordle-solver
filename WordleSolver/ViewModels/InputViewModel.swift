//
//  InputViewModel.swift
//  WordleSolver
//
//  Created by Stephanie Ananth on 3/3/24.
//

import Foundation

final class InputViewModel: ObservableObject {
    @Published var grayLetters: String = ""

    @Published var greenLetter1: String = ""
    @Published var greenLetter2: String = ""
    @Published var greenLetter3: String = ""
    @Published var greenLetter4: String = ""
    @Published var greenLetter5: String = ""

    @Published var yellowLetters1: String = ""
    @Published var yellowLetters2: String = ""
    @Published var yellowLetters3: String = ""
    @Published var yellowLetters4: String = ""
    @Published var yellowLetters5: String = ""

    @Published var searchText: String = ""

    private var words: [(String, Int)]

    var displayedWords: [(String, Int)] {
        if searchText.isEmpty {
            return validWords.top(10)
        }
        return validWords.filter { $0.0.contains(searchText.lowercased()) }.top(10)
    }

    private var validWords: [(String, Int)] {
        var validWords = [(String, Int)]()
        words.forEach {
            if !$0.0.containsLettersFrom(grayLetters) &&
                $0.0.matchesGreen([
                    greenLetter1.lowercased(),
                    greenLetter2.lowercased(),
                    greenLetter3.lowercased(),
                    greenLetter4.lowercased(),
                    greenLetter5.lowercased()
                ]) &&
                $0.0.matchesYellow([
                    yellowLetters1.lowercased(),
                    yellowLetters2.lowercased(),
                    yellowLetters3.lowercased(),
                    yellowLetters4.lowercased(),
                    yellowLetters5.lowercased()
                ]) {
                validWords.append($0)
            }
        }
        return validWords
    }

    init(words: [(String, Int)]) {
        self.words = words
    }

    func getStatus(for letter: Character) -> Status {
        if grayLetters.lowercased().contains(letter) {
            return .gray
        }

        if [
            greenLetter1.lowercased(),
            greenLetter2.lowercased(),
            greenLetter3.lowercased(),
            greenLetter4.lowercased(),
            greenLetter5.lowercased()
        ].joined().lowercased().contains(letter) {
            return .green
        }

        if [
            yellowLetters1.lowercased(),
            yellowLetters2.lowercased(),
            yellowLetters3.lowercased(),
            yellowLetters4.lowercased(),
            yellowLetters5.lowercased()
        ].joined().lowercased().contains(letter) {
            return .yellow
        }

        return .neutral
    }
}

fileprivate extension String {
    func containsLettersFrom(_ string: String) -> Bool {
        let stringSet = Set<Character>(self)
        let charSet = Set<Character>(string)
        return !stringSet.isDisjoint(with: charSet)
    }

    func matchesGreen(_ strings: [String]) -> Bool {
        guard !self.isEmpty else { return false }

        for (index, string) in strings.enumerated() {
            if !string.isEmpty {
                if String(self[index]) != string { return false }
            }
        }
        return true
    }

    func matchesYellow(_ strings: [String]) -> Bool {
        guard !self.isEmpty else { return false }

        for (index, string) in strings.enumerated() {
            if !string.isEmpty {
                if String(self[index]).containsLettersFrom(string) {
                    return false
                }
            }
        }
        return Set(self).isSuperset(of: Set<Character>(strings.joined()))
    }
}

fileprivate extension Array {
    func top(_ max: Int) -> Array {
        if count > max {
            return Array(self[0..<max])
        }
        return self
    }
}

extension StringProtocol {
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
    subscript(range: Range<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: ClosedRange<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: PartialRangeFrom<Int>) -> SubSequence { self[index(startIndex, offsetBy: range.lowerBound)...] }
    subscript(range: PartialRangeThrough<Int>) -> SubSequence { self[...index(startIndex, offsetBy: range.upperBound)] }
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence { self[..<index(startIndex, offsetBy: range.upperBound)] }
}
