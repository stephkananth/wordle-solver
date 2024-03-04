//
//  LetterButton.swift
//  WordleSolver
//
//  Created by Stephanie Ananth on 3/3/24.
//

import SwiftUI

struct LetterView: View {
    let letter: Character
    @Binding var status: Status

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
        LetterView(letter: "Q", status: .constant(.neutral))
        LetterView(letter: "A", status: .constant(.yellow([])))
        LetterView(letter: "Z", status: .constant(.gray))
        LetterView(letter: "B", status: .constant(.green([])))
    }
}
