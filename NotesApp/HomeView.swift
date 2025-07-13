//
//  HomeView.swift
//  NotesApp
//
//  Created by Ronak Punase on 13/07/25.
//

import SwiftUI

struct HomeView: View {
    let notes: [Note]
    
    init(notes: [Note]) {
        self.notes = notes
    }
    
    var body: some View {
        if notes.isEmpty {
            VStack (spacing: 8,) {
                Text("Welcome").font(.largeTitle)
                Text("Create your first note by tapping the + icon").font(.subheadline)
            }
        } else {
            List(notes) { note in
                NavigationLink {
                    NoteDetailView(note: note)
                } label: {
                    NoteListItem(note: note)
                }
            }
        }
    }
}
