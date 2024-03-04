//
//  ContentView.swift
//  WordleSolver
//
//  Created by Stephanie Ananth on 3/3/24.
//

import SwiftUI

struct ContentView: View {
    @State var analyzer: Analyzer? = nil
    @State var wordsSortedByScore: [(String, Int)]? = nil

    var body: some View {
        TabView {
            Text("Input")
                .tabItem {
                    Label("Input", systemImage: "pencil")
                }
            NavigationStack {
                Group {
                    if let wordsSortedByScore {
                        OutputView(words: wordsSortedByScore)
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
            let analyzer = await Analyzer(words: Parser().words)
            self.analyzer = analyzer
            self.wordsSortedByScore = await analyzer.wordsSortedByScore
        }
    }
}

#Preview {
    ContentView(analyzer: Analyzer(words: ["jamie", "julia", "shana", "steph"]))
}
