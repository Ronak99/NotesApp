//
//  NoteDetailView.swift
//  NotesApp
//
//  Created by Ronak Punase on 09/07/25.
//

import SwiftUI

struct NoteDetailView: View  {
    let note: Note
    
    init(note: Note) {
        self.note = note
    }
    
    var body: some View {
        VStack {
            Text(note.content)
        }
    }
}

#Preview {
    NoteDetailView(note: Note(id: 1, content: "Sample Content", createdAt: .now))
}
