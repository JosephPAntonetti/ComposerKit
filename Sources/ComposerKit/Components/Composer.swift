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
    @Environment(\.validator) private var validator
    @Environment(\.shouldUseModelContext) private var useModelContext
    
    private var CanSave : Bool {
        validator?.IsValid ?? true
    }
    
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
                            .disabled(!CanSave)
                    }
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel", role: .cancel, action: cancel)
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
            onSave()
            if useModelContext {
                modelContext.undoManager?.endUndoGrouping()
                do {
                    try modelContext.save()
                } catch {
                    fatalError("Failed to save model context")
                }
            }

            dismiss()
        }
    }
    
    private func cancel() {
        withAnimation {
            onCancel()
            if useModelContext {
                modelContext.undoManager?.endUndoGrouping()
                modelContext.undoManager?.undo()
            }
            
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
