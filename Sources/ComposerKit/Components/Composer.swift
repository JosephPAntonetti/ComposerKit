//
//  Composer.swift
//
//
//  Created by Joseph Antonetti on 12/20/23.
//

import SwiftUI
import SwiftData

public struct Composer<Content : View>: View {
    
    let title : String
    @ViewBuilder let content : () -> Content
    let onSave: () -> Void
    let onCancel: () -> Void
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @Environment(\.shouldUseModelContext) private var useModelContext
    
    public init(
        title: String,
        content: @escaping () -> Content,
        onSave: @escaping () -> Void,
        onCancel: @escaping () -> Void) {
            self.title = title
            self.content = content
            self.onSave = onSave
            self.onCancel = onCancel
        }
    
    public init(title: String, content: @escaping () -> Content) {
        self.init(title: title, content: content, onSave: {}, onCancel: {})
    }
    
    public var body: some View {
        NavigationView {
            content()
                .navigationTitle(title)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save", action: save)
                    }
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel", action: cancel)
                    }
                }
                .onAppear {
                    if useModelContext && modelContext.undoManager != nil {
                        modelContext.undoManager?.beginUndoGrouping()
                    }
                }
        }
    }
    
    private func save() {
        withAnimation {
            if useModelContext {
                modelContext.undoManager?.endUndoGrouping()
                do {
                    try modelContext.save()
                } catch {
                    fatalError("Failed to save model context")
                }
            }
            
            onSave()
            dismiss()
        }
    }
    
    private func cancel() {
        withAnimation {
            if useModelContext {
                modelContext.undoManager?.endUndoGrouping()
                modelContext.undoManager?.undo()
            }
            
            onCancel()
            dismiss()
        }
    }
}

#Preview {
    Composer(title: "Title") {
        Text("Content")
    } onSave: {
        
    } onCancel: {
        
    }
}
