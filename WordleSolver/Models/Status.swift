//
//  Status.swift
//  WordleSolver
//
//  Created by Stephanie Ananth on 3/3/24.
//

import SwiftUI

enum Status: Sendable {
    case neutral
    case gray
    case green
    case yellow

    var color: Color {
        switch self {
        case .neutral: .gray
        case .gray: .red
        case .green: .green
        case .yellow: .yellow
        }
    }
}
