//
//  LetterButton.swift
//  WordleSolver
//
//  Created by Stephanie Ananth on 3/3/24.
//

import SwiftUI

struct LetterView: View {
    let letter: Character
    var status: Status

    var body: some View {
        Text(String(letter).uppercased())
            .fontWeight(.black)
            .foregroundColor(.white)
            .monospaced()
            .padding(8.0)
            .background(status.color)
            .cornerRadius(8.0)
    }
}

#Preview {
    Group {
        LetterView(letter: "Q", status: .neutral)
        LetterView(letter: "A", status: .yellow)
        LetterView(letter: "Z", status: .gray)
        LetterView(letter: "B", status: .green)
    }
}
