//
//  NoteSample.swift
//  NotesApp
//
//  Created by Ronak Punase on 13/07/25.
//

import Foundation

extension Note {
    static var sampleItems : [Note] = [
        Note(id: 0, content: "Mock Note 1", createdAt: .now),
        Note(id: 1, content: "Mock Note 2", createdAt: .now.advanced(by: 2))
    ]
}
