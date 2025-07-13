//
//  NoteListItem.swift
//  NotesApp
//
//  Created by Ronak Punase on 12/07/25.
//

import SwiftUI

struct NoteListItem: View {
    let note: Note
    
    init(note: Note) {
        self.note = note
    }
    
    var body: some View {
        VStack (
            alignment: .leading,
        ) {
            Text(note.content).lineLimit(2).font(.title3)
            Text(note.createdAt.formatted()).font(.subheadline)
        }
    }
}

#Preview {
    NoteListItem(note: MockData.testNotes.first!)
}
