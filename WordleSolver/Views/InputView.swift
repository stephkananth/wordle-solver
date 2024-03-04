//
//  InputView.swift
//  WordleSolver
//
//  Created by Stephanie Ananth on 3/3/24.
//

import SwiftUI

struct InputView: View {
    @ObservedObject private var viewModel: InputViewModel

    var allWords: [(String, Int)]

    var body: some View {
        VStack {
            Form {
                Section("Top Options") {
                    List(viewModel.displayedWords, id: \.0) { (word, score) in
                        OutputRowView(word: word, score: score)
                    }
                    .searchable(text: $viewModel.searchText)
                    .autocorrectionDisabled()
                }

                Section("Gray Letters") {
                    TextField("Wrong Letters", text: $viewModel.grayLetters)
                }
            }

            HStack {
                Form {
                    Section("Green Letters") {
                        TextField("1", text: $viewModel.greenLetter1)
                        TextField("2", text: $viewModel.greenLetter2)
                        TextField("3", text: $viewModel.greenLetter3)
                        TextField("4", text: $viewModel.greenLetter4)
                        TextField("5", text: $viewModel.greenLetter5)
                    }
                }

                Form {
                    Section("Yellow Letters") {
                        TextField("1", text: $viewModel.yellowLetters1)
                        TextField("2", text: $viewModel.yellowLetters2)
                        TextField("3", text: $viewModel.yellowLetters3)
                        TextField("4", text: $viewModel.yellowLetters4)
                        TextField("5", text: $viewModel.yellowLetters5)
                    }
                }
            }

            Section {
                LettersView(viewModel: viewModel)
            }
        }
        .autocorrectionDisabled()
    }

    internal init(allWords: [(String, Int)]) {
        self.allWords = allWords
        self.viewModel = InputViewModel(words: allWords)
    }
}
