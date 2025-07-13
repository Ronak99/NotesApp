//
//  ContentView.swift
//  NotesApp
//
//  Created by Ronak Punase on 08/07/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var notesStore = NotesStore()
    
    var body: some View {
        NavigationStack {
            // content list
            HomeView(notes: notesStore.notes)
            .navigationTitle("My Notes")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink {
                        CreateNote().environmentObject(notesStore)
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
