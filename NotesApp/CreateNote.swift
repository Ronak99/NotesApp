//
//  CreateNote.swift
//  NotesApp
//
//  Created by Ronak Punase on 12/07/25.
//

import SwiftUI
import SwiftData

struct CreateNote: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @State private var content: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section(
                    header: Text("Write a note")
                ) {
                    TextEditor(
                        text: $content
                    )
                }
            }.navigationTitle("Create")
                .toolbar {
                    ToolbarItem {
                        Button {
                            let note = Note(
                                id: Int.random(in: 10...99), content: content, createdAt: .now
                            )
                            modelContext.insert(note)
                            
                            dismiss()
                        } label: {
                            Text("Save")
                        }
                    }
                }
        }
    }
}

//#Preview {
//    CreateNote()
//}
