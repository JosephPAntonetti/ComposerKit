//
//  ExampleModel.swift
//
//
//  Created by Joseph Antonetti on 12/20/23.
//

import Foundation
import SwiftData

@Model final class ExampleModel : ComposableModel {
    
    static var ModelName: String = "Example"
    
    var label : String
    
    var IsValid: Bool {
        !label.isEmpty
    }
    
    init(label: String) {
        self.label = label
    }
    
    static func empty() -> ExampleModel {
        ExampleModel(label: "New Model")
    }
}
