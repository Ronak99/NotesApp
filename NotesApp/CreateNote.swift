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
    
    let note: Note?
    
    init(note: Note? = nil) {
        self.note = note
        _content = State(initialValue: note?.content ?? "")
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section(
                    header: Text(note == nil ? "Write a note" : "Update your current note")
                ) {
                    TextEditor(
                        text: $content
                    )
                }
            }.navigationTitle(note == nil ? "Create" : "Update")
                .toolbar {
                    ToolbarItem {
                        Button {
                            if note == nil {
                                let note = Note(
                                    id: Int.random(in: 10...99), content: content, createdAt: .now
                                )
                                modelContext.insert(note)
                            } else {
                                note!.updateContent(content: content)
                            }
                            
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
