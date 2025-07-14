//
//  Preview.swift
//  NotesApp
//
//  Created by Ronak Punase on 13/07/25.
//

import SwiftUI
import SwiftData

struct Preview {
    let modelContainer : ModelContainer
    
    init() {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        do {
            modelContainer = try ModelContainer(for: Note.self, configurations: config)
        } catch {
            fatalError("Could not initiate the model container")
        }
    }
    
    func addSamples(_ samples: [Note]) {
        Task {
            @MainActor in samples.forEach {
                note in modelContainer.mainContext.insert(note)
            }
        }
    }
}
 
#Preview {
    let preview = Preview()
    let _ = preview.addSamples([Note(content: "String", createdAt: .now)])
    ContentView()
        .modelContainer(preview.modelContainer)
}
