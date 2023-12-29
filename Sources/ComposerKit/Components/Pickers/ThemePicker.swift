//
//  ThemePicker.swift
//
//
//  Created by Joseph Antonetti on 12/28/23.
//

import SwiftUI
import Pickers

public struct ThemePicker: View {
    
    @Binding var theme : Theme
    
    public init(
        theme: Binding<Theme>
    ) {
        self._theme = theme
    }
    
    public var body: some View {
        GridPicker(
            selection: $theme,
            columnCount: 7,
            items: Theme.allCases) {
            Circle()
                .fill()
                .foregroundStyle($0)
        }
    }
}

#Preview {
    ThemePicker(theme: .constant(.red))
}
