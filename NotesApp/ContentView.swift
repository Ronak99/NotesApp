//
//  ContentView.swift
//  NotesApp
//
//  Created by Ronak Punase on 08/07/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var notes: [Note]
    
    var body: some View {
        NavigationStack {
            // content list
            HomeView(notes: notes)
            .navigationTitle("My Notes")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink {
                        CreateNote()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

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

#Preview {
    ContentView()
}
