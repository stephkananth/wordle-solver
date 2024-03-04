//
//  InputView.swift
//  WordleSolver
//
//  Created by Stephanie Ananth on 3/3/24.
//

import SwiftUI

struct InputView: View {
    @State private var grayLetters: String = ""
    
    @State private var greenLetter1: String = ""
    @State private var greenLetter2: String = ""
    @State private var greenLetter3: String = ""
    @State private var greenLetter4: String = ""
    @State private var greenLetter5: String = ""
    @State private var greenLetter6: String = ""

    @State private var yellowLetters1: String = ""
    @State private var yellowLetters2: String = ""
    @State private var yellowLetters3: String = ""
    @State private var yellowLetters4: String = ""
    @State private var yellowLetters5: String = ""
    @State private var yellowLetters6: String = ""

    var body: some View {
        Form {
            Section("Top Options") {
                OutputView(words: [
                    ("crane", 3),
                    ("arose", 2),
                    ("audio", 1)
                ])
            }

            Section("Gray Letters") {
                TextField("Wrong Letters", text: $grayLetters)
            }

            Section("Green Letters") {
                    TextField("1", text: $greenLetter1)
                    TextField("2", text: $greenLetter2)
                    TextField("3", text: $greenLetter3)
                    TextField("4", text: $greenLetter4)
                    TextField("5", text: $greenLetter5)
                    TextField("6", text: $greenLetter6)
            }

            Section("Yellow Letters") {
                TextField("1", text: $yellowLetters1)
                TextField("2", text: $yellowLetters2)
                TextField("3", text: $yellowLetters3)
                TextField("4", text: $yellowLetters4)
                TextField("5", text: $yellowLetters5)
                TextField("6", text: $yellowLetters6)
            }

            Section {
                LettersView()
            }
        }
        .autocorrectionDisabled()
    }
}

#Preview {
    InputView()
}
