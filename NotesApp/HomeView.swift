//
//  HomeView.swift
//  NotesApp
//
//  Created by Ronak Punase on 13/07/25.
//

import SwiftUI

struct HomeView: View {
    let notes: [Note]
    @State var value : Int = -1
    @Environment(\.modelContext) private var modelContext
    
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
            List {
                ForEach(notes) { note in
                    NoteListItem(note: note)
                }.onDelete(perform: { indexSet in
                    for index in indexSet {
                        onDelete(notes[index])
                    }
                })
            }
        }
    }
    
    func onDelete(_ note: Note) {
        modelContext.delete(note)
    }
}
