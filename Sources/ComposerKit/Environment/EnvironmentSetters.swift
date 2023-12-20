//
//  EnvironmentSetters.swift
//
//
//  Created by Joseph Antonetti on 12/20/23.
//

import Foundation
import SwiftUI

public extension View {
    
    func modifyModelContextWithComposer(_ shouldModifyModelContext : Bool) -> some View {
        self
            .environment(\.shouldUseModelContext, shouldModifyModelContext)
    }
}
