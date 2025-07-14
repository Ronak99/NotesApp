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
    private(set) var content: String
    private(set) var createdAt: Date
    
    @Attribute(.externalStorage)
    private(set) var noteCover: Data?
    
    init(content: String, createdAt: Date) {
        self.content = content
        self.createdAt = createdAt
    }
    
    func updateContent(content: String) {
        self.content = content
    }
    
    func updateNoteCover(data: Data?) {
        self.noteCover = data
    }
}


