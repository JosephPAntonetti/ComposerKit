//
//  Theme.swift
//
//
//  Created by Joseph Antonetti on 12/20/23.
//

import Foundation
import SwiftUI

public enum Theme : ShapeStyle, Codable, CaseIterable, Identifiable {
    
    public var id : Self { self }
    
    case red
    case green
    case blue
    case orange
    case purple
    case black
    case pink
    case yellow
    
    public func resolve(in environment: EnvironmentValues) -> some ShapeStyle {
        switch self {
        case .red:
            Color.red
        case .green:
            Color.green
        case .blue:
            Color.blue
        case .orange:
            Color.orange
        case .purple:
            Color.purple
        case .black:
            Color.black
        case .pink:
            Color.pink
        case .yellow:
            Color.yellow
        }
    }
}

#Preview {
    ForEach(Theme.allCases) {
        theme in
        GroupBox {
            Text("Primary")
                .foregroundStyle(.primary)
            Text("Secondary")
                .foregroundStyle(.secondary)
            Text("Ternary")
                .foregroundStyle(.tertiary)
        }
        .foregroundStyle(theme)
    }
}
