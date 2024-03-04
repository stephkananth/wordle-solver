//
//  LettersView.swift
//  WordleSolver
//
//  Created by Stephanie Ananth on 3/3/24.
//

import SwiftUI

struct LettersView: View {
    @ObservedObject var viewModel: InputViewModel

    var body: some View {
        VStack {
            HStack {
                ForEach(Array(Constants.TOP_ROW), id: \.self) {
                    LetterView(letter: $0, status: viewModel.getStatus(for: $0))
                }
            }
            HStack {
                ForEach(Array(Constants.MIDDLE_ROW), id: \.self) {
                    LetterView(letter: $0, status: viewModel.getStatus(for: $0))
                }
            }
            HStack {
                ForEach(Array(Constants.BOTTOM_ROW), id: \.self) {
                    LetterView(letter: $0, status: viewModel.getStatus(for: $0))
                }
            }
        }
    }
}
