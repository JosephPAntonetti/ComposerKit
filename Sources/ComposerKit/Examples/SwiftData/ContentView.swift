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
                NavigationLink {
                    ModelComposer {
                        ComposerContent(model: $0)
                    }
                } label: {
                    Text("Add New")
                }
                ForEach(models) {
                    model in
                    NavigationLink {
                        ModelComposer(model: model) {
                            ComposerContent(model: $0)
                        }
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
