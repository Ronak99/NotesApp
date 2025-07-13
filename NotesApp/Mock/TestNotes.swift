//
//  TestNotes.swift
//  NotesApp
//
//  Created by Ronak Punase on 08/07/25.
//

import SwiftUI

struct MockData {
    @State static public var testNotes: [Note] = [
        Note(id: 1, content: "Note 1", createdAt: .now),
    ]
    
    static func addTestNote(_ note: Note) {
        testNotes.append(note)
    }
}
