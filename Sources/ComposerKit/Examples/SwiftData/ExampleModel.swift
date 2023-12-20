//
//  ExampleModel.swift
//
//
//  Created by Joseph Antonetti on 12/20/23.
//

import Foundation
import SwiftData

@Model class ExampleModel {
    
    var label : String
    
    init(label: String) {
        self.label = label
    }
}
