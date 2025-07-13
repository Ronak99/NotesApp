//
//  NotesAppApp.swift
//  NotesApp
//
//  Created by Ronak Punase on 08/07/25.
//
import SwiftUI
import SwiftData

@main
struct NotesApp: App {
    var body: some Scene {
        WindowGroup() {
            ContentView()
        }.modelContainer(for: Note.self)
    }
}

