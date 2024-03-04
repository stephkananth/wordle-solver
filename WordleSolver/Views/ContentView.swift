//
//  ContentView.swift
//  WordleSolver
//
//  Created by Stephanie Ananth on 3/3/24.
//

import SwiftUI

struct ContentView: View {
    @State var allWords: [(String, Int)]? = nil

    var body: some View {
        TabView {
            NavigationStack {
                Group {
                    if let allWords {
                        InputView(allWords: allWords)
                    } else {
                        ProgressView()
                    }
                }
                .navigationTitle("Wordle Solver")
            }
            .tabItem {
                Label("Input", systemImage: "pencil")
            }
            NavigationStack {
                Group {
                    if let allWords {
                        OutputView(words: allWords)
                    } else {
                        ProgressView()
                    }
                }
                .navigationTitle("Word List")
            }
            .tabItem {
                Label("Word List", systemImage: "list.star")
            }

        }
        .task {
            let words = await Parser().words
            let analyzer = Analyzer(words: words)
            self.allWords = await analyzer.wordsSortedByScore
        }
    }
}
