//
//  OutputRowView.swift
//  WordleSolver
//
//  Created by Steph on 3/3/24.
//

import SwiftUI

struct OutputRowView: View {
    var word: String
    var score: Int

    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text(word)
            Spacer()
            Text("\(score)")
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    List {
        OutputRowView(word: "steph", score: 1998)
    }
}
