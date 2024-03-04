//
//  Parser.swift
//  WordleSolver
//
//  Created by Stephanie Ananth on 3/3/24.
//

import Foundation

struct Parser: Sendable {
    private let url = URL(string: "https://api.github.com/gists/dd0668f281e685bad51479e5acaadb93")

    var words: [String] {
        get async {
            guard let url else {
                print("parser.url is nil")
                return []
            }

            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let validWordleWords = try JSONDecoder().decode(ValidWordleWords.self, from: data)
                return validWordleWords.files.file.content.components(separatedBy: .newlines)
            } catch {
                print("parser.words: \(error.localizedDescription)")
                return []
            }
        }
    }
}
