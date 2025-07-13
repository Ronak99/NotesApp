//
//  Note.swift
//  NotesApp
//
//  Created by Ronak Punase on 08/07/25.
//

import Foundation

struct Note: Hashable, Identifiable {
    let id: Int
    let content: String
    let createdAt: Date
    
    init(id: Int, content: String, createdAt: Date) {
        self.id = id
        self.content = content
        self.createdAt = createdAt
    }
}
