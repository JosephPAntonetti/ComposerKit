//
//  ComposableModel.swift
//
//
//  Created by Joseph Antonetti on 12/20/23.
//

import Foundation
import SwiftData

public protocol ComposableModel : PersistentModel, Validator {
    
    static var ModelName : String { get }

}
