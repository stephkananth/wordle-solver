//
//  ValidWordleWords.swift
//  WordleSolver
//
//  Created by Stephanie Ananth on 3/3/24.
//

import Foundation

struct ValidWordleWords: Codable, Sendable {
    let files: Files
}

struct Files: Codable, Sendable {
    let file: File

    enum CodingKeys: String, CodingKey, Sendable {
        case file = "valid-wordle-words.txt"
    }
}

struct File: Codable, Sendable {
    let content: String
}
