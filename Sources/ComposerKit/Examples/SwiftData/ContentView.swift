//
//  ContentView.swift
//
//
//  Created by Joseph Antonetti on 12/20/23.
//

import SwiftUI
import SwiftData

struct ComposerContent : View {
    
    @State var model : ExampleModel
    
    var body : some View {
        List {
            TextField("Label", text: $model.label)
        }
    }
}

struct ContentView: View {
    
    @Query var models : [ExampleModel]
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationView {
            List {
                ForEach(models) {
                    model in
                    NavigationLink {
                        Composer(title: "composer title") {
                            ComposerContent(model: model)
                        }
                        .modifyModelContextWithComposer(true)
                    } label: {
                        Text(model.label)
                    }
                }
            }
            .navigationTitle("Title")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Button("Add New") {
                        let model = ExampleModel(label: "New")
                        modelContext.insert(model)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ExampleModel.self, inMemory: true, isUndoEnabled: true)
}
