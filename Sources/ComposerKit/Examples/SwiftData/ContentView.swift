//
//  ContentView.swift
//
//
//  Created by Joseph Antonetti on 12/20/23.
//

import SwiftUI
import SwiftData

struct ExampleComposer : View {
    
    @Bindable var model : ExampleModel
    
    init() {
        model = ExampleModel.empty()
    }
    
    init(model: ExampleModel) {
        self.model = model
    }
    
    var body : some View {
        ModelComposer(model: model) {
            List {
                TextField("Label", text: $model.label)
            }
        }
    }
}


struct ContentView: View {
    
    @Query var models : [ExampleModel]
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationView {
            List {
                    NavigationLink {
                        ExampleComposer(model: .empty())
                    } label: {
                        Text("Add New")
                    }
                ForEach(models) {
                    model in
                    NavigationLink {
                       ExampleComposer(model: model)
                    } label: {
                        Text(model.label)
                    }
                }
            }
            .navigationTitle("Title")

        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ExampleModel.self, inMemory: true, isUndoEnabled: true)
}
