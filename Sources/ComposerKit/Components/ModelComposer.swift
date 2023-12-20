//
//  ModelComposer.swift
//
//
//  Created by Joseph Antonetti on 12/20/23.
//

import SwiftUI
import SwiftData

public struct ModelComposer<Model: ComposableModel, Content: View>: View {
    
    @Bindable var model : Model
    @ViewBuilder let content : () -> Content
    
    @Environment(\.modelContext) private var modelContext
    
    private var doesModelExist : Bool {
        model.modelContext != nil
    }
    
    private var title : String {
        doesModelExist ? "Edit \(Model.ModelName)" : "Create \(Model.ModelName)"
    }
    
    public init(model: Model, content: @escaping () -> Content) {
        self.model = model
        self.content = content
    }
    
    public var body: some View {
        Composer(title: title) {
            content()
        } onSave: {
            if !doesModelExist {
                modelContext.insert(model)
            }
        } onCancel: {
        }
        .validator(model)
        .modifyModelContextWithComposer(true)
    }
}
