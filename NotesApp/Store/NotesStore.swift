//
//  NotesStore.swift
//  NotesApp
//
//  Created by Ronak Punase on 13/07/25.
//

import Foundation

class NotesStore: ObservableObject {
    @Published var notes : [Note] = []
    
    func add(note n: Note) {
        notes.append(n)
    }
}
