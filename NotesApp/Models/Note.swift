//
//  Note.swift
//  NotesApp
//
//  Created by Ronak Punase on 08/07/25.
//

import Foundation
import SwiftData

@Model
class Note {
    var id: Int
    var content: String
    var createdAt: Date
    
    init(id: Int, content: String, createdAt: Date) {
        self.id = id
        self.content = content
        self.createdAt = createdAt
    }
}


