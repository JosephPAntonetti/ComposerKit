//
//  EnvironmentValues.swift
//
//
//  Created by Joseph Antonetti on 12/20/23.
//

import Foundation
import SwiftUI

private struct ShouldUseModelContextEnvironmentKey : EnvironmentKey {
    static let defaultValue = false
}

extension EnvironmentValues {
    
    var shouldUseModelContext : Bool {
        get {
            self[ShouldUseModelContextEnvironmentKey.self]
        }
        set {
            self[ShouldUseModelContextEnvironmentKey.self] = newValue
        }
    }
}
